import 'package:flutter/material.dart';

class BlocInternetConnectivity extends StatelessWidget {
  final String pageTitle;

  const BlocInternetConnectivity({super.key, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: const Text("Loading..."),
      ),
    );
  }
}
