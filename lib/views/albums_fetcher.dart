import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/album.dart';
import 'package:http/http.dart' as http;

Future<List<Album>> fetchAlbums() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  if (response.statusCode == 200) {
    List<Album> albumList = [];
    String stringResponse = response.body;
    List<dynamic> tempList = json.decode(stringResponse);
    for (int i = 0; i < tempList.length; i++) {
      Album album = Album.fromJson(tempList[i]);
      albumList.add(album);
    }
    return albumList;
  } else {
    throw Exception("Failed to load Album List");
  }
}

class AlbumsFetcher extends StatefulWidget {
  final String pageTitle;

  const AlbumsFetcher({super.key, required this.pageTitle});

  @override
  State<StatefulWidget> createState() => _AlbumsFetcher();
}

class _AlbumsFetcher extends State<AlbumsFetcher> {
  late Future<List<Album>> futureAlbumList;
  late List<Album> albumList = [];
  late String responseError;
  @override
  void initState() {
    super.initState();
    futureAlbumList = fetchAlbums();
    futureAlbumList.then((value) => {albumList = value}).onError((error, stackTrace) => Future.error(error!, stackTrace));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.pageTitle)),
        body: ListView.builder(
            itemCount: albumList.length,
            itemBuilder: (context, index) {
              final album = albumList[index];
              return ListTile(
                title: Text("${album.id}"),
                subtitle: Text(album.title),
              );
            }));
  }
}