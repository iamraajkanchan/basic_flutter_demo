import 'package:basic_flutter_demo/views/utility.dart';
import 'package:flutter/material.dart';

class BlocDemo extends StatefulWidget {
  final String pageTitle;

  const BlocDemo({super.key, required this.pageTitle});

  @override
  State<StatefulWidget> createState() => _BlocDemo();
}

class _BlocDemo extends State<BlocDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.pageTitle)),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Utility.addVerticalSpace(),
              const Text("Bloc Demo")
            ],
          ),
        ),
      ),
    );
  }
}
