import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import '../models/booking.dart';
import 'package:http/http.dart' as http;

class BookingServices extends ChangeNotifier {

  Booking _bookingData = new Booking(name:"",user: "");

  User get bookingData => _bookingData;

  void setBookingData(Booking bookingData) {
    _bookingData = bookingData;
  }
  Future<List<Booking>?> getBookings() async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:5432/api/bookings');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return bookingFromJson(json);
    }
    return null;
  }


  Future<void> createBooking(Booking booking) async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:5432/api/bookings/booking');
    var userJS = json.encode(user.toJson());
    await client.post(uri,
        headers: {'content-type': 'application/json'}, body: userJS);
  }
}
