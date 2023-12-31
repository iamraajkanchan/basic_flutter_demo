import 'package:basic_flutter_demo/blocs/internet_blocs/internet_bloc.dart';
import 'package:basic_flutter_demo/blocs/sign_in_blocs/sign_in_bloc.dart';
import 'package:basic_flutter_demo/views/bloc_demo/bloc_internet_connectivity.dart';
import 'package:basic_flutter_demo/views/bloc_demo/bloc_validation.dart';
import 'package:basic_flutter_demo/views/bloc_demo/cubit_internet_connectivity.dart';
import 'package:basic_flutter_demo/views/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocDemo extends StatefulWidget {
  final String pageTitle;

  const BlocDemo({super.key, required this.pageTitle});

  @override
  State<StatefulWidget> createState() => _BlocDemo();
}

class _BlocDemo extends State<BlocDemo> {
  void onInternetConnectivityClick() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const BlocInternetConnectivity(
              pageTitle: "Bloc Internet Connectivity Demo",
            )));
  }

  void onCubitInternetConnectivityClick() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const CubitInternetConnectivity(
            pageTitle: "Cubit Internet Connectivity Demo")));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.pageTitle),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Utility.addVerticalSpace(),
                ElevatedButton(
                  onPressed: onInternetConnectivityClick,
                  child: const Text("Bloc Internet Connectivity"),
                ),
                Utility.addVerticalSpace(),
                ElevatedButton(
                    onPressed: onCubitInternetConnectivityClick,
                    child: const Text("Cubit Internet Connectivity")),
                Utility.addVerticalSpace(),
                BlocProvider(
                  create: (context) => SignInBloc(),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BlocValidation(
                                pageTitle: "Bloc Validation Demo")));
                      },
                      child: const Text("Bloc Validation")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
