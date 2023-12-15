import 'package:basic_flutter_demo/views/utility.dart';
import 'package:flutter/material.dart';

class StateLessLifecycle extends StatelessWidget {
  final String pageTitle;

  const StateLessLifecycle({super.key, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    print("${Utility.TAG} :: StateLessLifecycle :: build");
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text("StateLess Lifecycle"),
      ),
    );
  }
}

/**
 * Log Output
 * MyFlutterApp :: StateLessLifecycle :: build
 * */
