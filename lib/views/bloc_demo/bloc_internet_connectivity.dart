import 'package:basic_flutter_demo/blocs/internet_blocs/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocInternetConnectivity extends StatelessWidget {
  final String pageTitle;

  const BlocInternetConnectivity({super.key, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(pageTitle),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
            child: BlocConsumer<InternetBloc, InternetState>(
          builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text("Connected");
            } else if (state is InternetLostState) {
              return const Text("Not Connected");
            } else {
              return const Text("Loading...");
            }
          },
          listener: (BuildContext context, InternetState state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet Connected!"),
                backgroundColor: Colors.greenAccent,
              ));
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet Disconnected!"),
                backgroundColor: Colors.redAccent,
              ));
            }
          },
        )
            /*
          BlocBuilder<InternetBloc, InternetState>(
            builder: (context, state) {
              if (state is InternetGainedState) {
                return const Text("Connected");
              } else if (state is InternetLostState) {
                return const Text("Not Connected");
              } else {
                return const Text("Loading...");
              }
            },
          )
          */
            ),
      ),
    );
  }
}

/**
 * With BlockConsumer you can have UI changes and a SnackBar/Navigator/Flutter Toast.
 * */
