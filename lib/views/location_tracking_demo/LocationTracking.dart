import 'package:flutter/material.dart';

class LocationTracking extends StatefulWidget {
  final String pageTitle;

  const LocationTracking({super.key, required this.pageTitle});

  @override
  State<StatefulWidget> createState() => _LocationTracking();
}

class _LocationTracking extends State<LocationTracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [Text("Location Tracking Demo")],
        ),
      ),
    );
  }
}
