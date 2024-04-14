import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_database/firebase_database.dart';

class LocationDataPage extends StatefulWidget {
  @override
  _LocationDataPageState createState() => _LocationDataPageState();
}

class _LocationDataPageState extends State<LocationDataPage> {
  final FirebaseDatabase database = FirebaseDatabase.instance;
  late DatabaseReference locationRef;

  @override
  void initState() {
    super.initState();
    // Initialize a reference to your Firebase database
    locationRef = database.reference().child('values').child('date_time');
    // Call the method to get current location and store it
    _getCurrentLocationAndStore();
  }

  // Method to get current location and store it in the database
  Future<void> _getCurrentLocationAndStore() async {
    // Get the current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // Get the current date/time
    DateTime now = DateTime.now();
    // Create a map with location and date/time data
    Map<String, dynamic> locationData = {
      'latitude': position.latitude,
      'longitude': position.longitude,
      'timestamp': now.toIso8601String(),
    };
    // Store the data in the database
    locationRef.push().set(locationData);
    print('data send');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Data'),
      ),
      body: const Center(
        child: Text('Location data has been stored in the database.'),
      ),
    );
  }
}
