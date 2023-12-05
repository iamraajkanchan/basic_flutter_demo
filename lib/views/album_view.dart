import 'package:basic_flutter_demo/model/album.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AlbumView extends StatelessWidget {
  final Album album;

  const AlbumView({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              color: const Color.fromRGBO(124, 124, 124, 95.0),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text("${album.id}"),
              )),
          Text(
            album.title,
            softWrap: true,
            maxLines: 2,
          )
        ],
      ),
    ));
  }
}
