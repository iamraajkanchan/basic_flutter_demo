import 'package:basic_flutter_demo/views/album_fetcher.dart';
import 'package:basic_flutter_demo/views/albums_fetcher.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    void onAlbumClick() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AlbumFetcher(pageTitle: "Single Album")));
    }

    void onAlbumsClick() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AlbumsFetcher(pageTitle: "Album List")));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: onAlbumClick,
                  child: const Padding(
                      padding: EdgeInsets.all(24.0), child: Text("Album")),
                )),
            Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: onAlbumsClick,
                  child: const Padding(
                      padding: EdgeInsets.all(24.0), child: Text("Albums")),
                ))
          ],
        )
      ]),
    );
  }
}
