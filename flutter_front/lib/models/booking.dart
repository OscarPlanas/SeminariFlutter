// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<Booking> bookingFromJson(String str) =>
    List<Booking>.from(json.decode(str).map((x) => Booking.fromJson(x)));

String bookingToJson(List<Booking> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Booking {
  Booking({
    //this.id = "", // non nullable but optional with a default value
    required this.name,
    required this.user,
  });

  String user;
  String name;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        user: json["user"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
      };
}
