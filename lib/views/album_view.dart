import 'package:basic_flutter_demo/model/album.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AlbumView extends StatelessWidget {
  final Album album;

  const AlbumView({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.lime,
            shape: BoxShape.rectangle
          ),
          child: Text(
            "${album.id}",
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        const Spacer(flex: 1,),
        Expanded(
            flex: 4,
            child: Text(
              album.title,
              softWrap: true,
              maxLines: 2,
            ))
      ],
    ));
  }
}
