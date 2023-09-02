import 'package:flutter/cupertino.dart';

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key, required this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text(title ?? "N/A")]);
  }
}
