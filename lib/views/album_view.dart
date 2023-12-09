import 'package:basic_flutter_demo/model/album.dart';
import 'package:flutter/material.dart';

class AlbumView extends StatelessWidget {
  final Album album;

  const AlbumView({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          DecoratedBox(
            decoration:
                const BoxDecoration(color: Colors.lime, shape: BoxShape.circle),
            child: SizedBox(
              width: 100.0,
              height: 100.0,
              child: Center(
                child: Text(
                  "${album.id}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Expanded(
              flex: 7,
              child: Text(
                album.title,
                softWrap: true,
                maxLines: 2,
              ))
        ],
      ),
    ));
  }
}
