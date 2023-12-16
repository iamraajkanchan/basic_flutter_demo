import 'package:basic_flutter_demo/views/album_fetcher.dart';
import 'package:basic_flutter_demo/views/albums_fetcher.dart';
import 'package:basic_flutter_demo/views/image_picker.dart';
import 'package:basic_flutter_demo/views/provider_demo.dart';
import 'package:basic_flutter_demo/views/stateful_lifecycle.dart';
import 'package:basic_flutter_demo/views/stateless_lifecycle.dart';
import 'package:basic_flutter_demo/views/utility.dart';
import 'package:basic_flutter_demo/views/video_player.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

    void onCameraPreviewClick() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              const ImagePickerDemo(pageTitle: "ImagePicker Preview")));
    }

    void onVideoPlayerClick() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              const VideoPlayerDemo(pageTitle: "Video Player Preview")));
    }

    void onStateLessLifecycleClick() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const StateLessLifecycle(
              pageTitle: "StateLess Widget Lifecycle")));
    }

    void onStatefulLifecycleClick() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              const StatefulLifecycle(pageTitle: "Stateful Widget Lifecycle")));
    }

    void onProviderDemoClick() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              const ProviderDemo(pageTitle: "Provider Demo")));
    }

    void onBlocDemoClick() {
      Fluttertoast.showToast(
          msg: "Bloc Demo is in progress!", toastLength: Toast.LENGTH_LONG);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Utility.addHorizontalSpace(),
            Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: onAlbumClick,
                  child: const Text("Album"),
                )),
            Utility.addHorizontalSpace(),
            Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: onAlbumsClick,
                  child: const Text("Albums"),
                )),
            Utility.addHorizontalSpace(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Utility.addHorizontalSpace(),
            Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: onCameraPreviewClick,
                  child: const Text("Image Picker"),
                )),
            Utility.addHorizontalSpace(),
            Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: onVideoPlayerClick,
                  child: const Text("Video Player"),
                )),
            Utility.addHorizontalSpace(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Utility.addHorizontalSpace(),
            Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: onProviderDemoClick,
                  child: const Text(
                    "Provider Demo",
                    textAlign: TextAlign.center,
                  ),
                )),
            Utility.addHorizontalSpace(),
            Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: onBlocDemoClick,
                  child: const Text(
                    "Bloc Demo",
                    textAlign: TextAlign.center,
                  ),
                )),
            Utility.addHorizontalSpace(),
          ],
        )
      ]),
    );
  }
}
