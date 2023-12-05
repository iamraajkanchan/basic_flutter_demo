import 'package:flutter/material.dart';

class PostFetcher extends StatefulWidget {
  const PostFetcher({super.key, required this.pageTitle});

  final String pageTitle;

  @override
  State<PostFetcher> createState() => _PostFetcher();
}

class _PostFetcher extends State<PostFetcher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(widget.pageTitle),
    ));
  }
}
