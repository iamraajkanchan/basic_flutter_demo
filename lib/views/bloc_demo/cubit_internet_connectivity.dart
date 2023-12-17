import 'package:basic_flutter_demo/blocs/cubits/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitInternetConnectivity extends StatelessWidget {
  final String pageTitle;

  const CubitInternetConnectivity({super.key, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(pageTitle),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
            child: BlocConsumer<InternetCubit, InternetState>(
          builder: (context, state) {
            if (state == InternetState.gained) {
              return const Text("Connected");
            } else if (state == InternetState.lost) {
              return const Text("Not Connected");
            } else {
              return const Text("Loading...");
            }
          },
          listener: (BuildContext context, InternetState state) {
            if (state == InternetState.gained) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet Connected!"),
                backgroundColor: Colors.greenAccent,
              ));
            } else if (state == InternetState.lost) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet Disconnected!"),
                backgroundColor: Colors.redAccent,
              ));
            }
          },
        )),
      ),
    );
  }
}
