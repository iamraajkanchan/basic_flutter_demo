import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationTracking extends StatefulWidget {
  final String pageTitle;

  const LocationTracking({super.key, required this.pageTitle});

  @override
  State<StatefulWidget> createState() => _LocationTracking();
}

class _LocationTracking extends State<LocationTracking> {
  Future<Position> _getLastKnownPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled!');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permissions are denied!");
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: Center(
        child: FutureBuilder(
            future: _getLastKnownPosition(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text("Error : ${snapshot.error}");
                } else {
                  return Text(
                      "Longitude: ${snapshot.data?.longitude}, Latitude: ${snapshot.data?.latitude}");
                }
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
