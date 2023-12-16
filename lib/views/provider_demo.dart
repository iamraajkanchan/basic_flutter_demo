import 'package:basic_flutter_demo/providers/provider_demo_provider.dart';
import 'package:basic_flutter_demo/views/utility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderDemo extends StatefulWidget {
  final String pageTitle;

  const ProviderDemo({super.key, required this.pageTitle});

  @override
  State<StatefulWidget> createState() => _ProviderDemo();
}

class _ProviderDemo extends State<ProviderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: ChangeNotifierProvider<ProviderDemoProvider>(
            create: (context) => ProviderDemoProvider(),
            child: Consumer<ProviderDemoProvider>(
              builder: (BuildContext context, ProviderDemoProvider provider,
                  Widget? child) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Utility.addVerticalSpace(),
                        Utility.addVerticalSpace(),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration:
                              const InputDecoration(hintText: "Enter Your Age"),
                          onChanged: (value) {
                            provider.checkEligibility(int.parse(value));
                          },
                        ),
                        Utility.addVerticalSpace(),
                        Text(
                          provider.eligibilityMessage.toString(),
                          style: TextStyle(
                              color: (provider.isEligible == true)
                                  ? Colors.green
                                  : Colors.red),
                        ),
                      ]),
                );
              },
            )),
      ),
    );
  }
}
