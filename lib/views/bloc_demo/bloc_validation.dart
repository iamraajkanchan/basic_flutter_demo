import 'package:basic_flutter_demo/blocs/sign_in_blocs/sign_in_bloc.dart';
import 'package:basic_flutter_demo/views/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocValidation extends StatelessWidget {
  final String pageTitle;

  BlocValidation({super.key, required this.pageTitle});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(pageTitle),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Utility.addVerticalSpace(),
              TextField(
                controller: emailController,
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangeEvent(
                          emailValue: emailController.text,
                          passwordValue: passwordController.text));
                },
                decoration: const InputDecoration(hintText: "Email Address"),
                keyboardType: TextInputType.emailAddress,
              ),
              Utility.addVerticalSpace(),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInErrorState) {
                    return Text(
                      state.errorMessage,
                      style: const TextStyle(color: Colors.red),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              Utility.addVerticalSpace(),
              TextField(
                controller: passwordController,
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangeEvent(
                          emailValue: emailController.text,
                          passwordValue: passwordController.text));
                },
                decoration: const InputDecoration(hintText: "Password"),
              ),
              SizedBox(
                  width: 200,
                  child: BlocBuilder<SignInBloc, SignInState>(
                    builder: (context, state) {
                      if (state is SignInLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return ElevatedButton(
                        onPressed: () {
                          if (state is SignInValidState) {
                            BlocProvider.of<SignInBloc>(context).add(
                                SignInSubmittedEvent(
                                    email: emailController.text,
                                    password: passwordController.text));
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: (state is SignInValidState)
                                ? const MaterialStatePropertyAll(Colors.blue)
                                : const MaterialStatePropertyAll(Colors.grey)),
                        child: const Text("Sign In"),
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
