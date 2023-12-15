import 'package:basic_flutter_demo/views/utility.dart';
import 'package:flutter/material.dart';

class StatefulLifecycle extends StatefulWidget {
  final String pageTitle;

  const StatefulLifecycle({super.key, required this.pageTitle});

  @override
  State<StatefulWidget> createState() {
    print("${Utility.TAG} :: StatefulLifecycle :: createState");
    return _StatefulLifecycle();
  }
}

class _StatefulLifecycle extends State<StatefulLifecycle> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    print("${Utility.TAG} :: StatefulLifecycle :: initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("${Utility.TAG} :: StatefulLifecycle :: didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant StatefulLifecycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("${Utility.TAG} :: StatefulLifecycle :: didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("${Utility.TAG} :: StatefulLifecycle :: deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("${Utility.TAG} :: StatefulLifecycle :: dispose");
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print("${Utility.TAG} :: StatefulLifecycle :: setState");
  }

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Utility.addVerticalSpace(),
          const Text("Stateful Lifecycle"),
          Utility.addVerticalSpace(),
          Text(counter.toString()),
          Utility.addVerticalSpace(),
          ElevatedButton(
              onPressed: incrementCounter, child: const Icon(Icons.add))
        ],
      )),
    );
  }
}

/**
 * Log Output
 * 15:25:36.623  I  MyFlutterApp :: StatefulLifecycle :: createState
 * 15:25:36.624  I  MyFlutterApp :: StatefulLifecycle :: initState
 * 15:25:36.624  I  MyFlutterApp :: StatefulLifecycle :: didChangeDependencies
 * ---- The above lifecycle method is called before user sees the widget -------
 * 15:25:45.194  I  MyFlutterApp :: StatefulLifecycle :: setState
 * ---- The above lifecycle method is called if user interacts with the Widget -
 * 15:25:49.155  I  MyFlutterApp :: StatefulLifecycle :: deactivate
 * 15:25:49.194  I  MyFlutterApp :: StatefulLifecycle :: dispose
 * ---- The above lifecycle method is called if user presses back button -------
 * */