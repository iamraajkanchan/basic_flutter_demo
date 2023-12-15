import 'package:basic_flutter_demo/views/utility.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerDemo extends StatefulWidget {
  final String pageTitle;

  const VideoPlayerDemo({super.key, required this.pageTitle});

  @override
  State<StatefulWidget> createState() => _VideoPlayerDemo();
}

class _VideoPlayerDemo extends State<VideoPlayerDemo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    print("${Utility.TAG} :: VideoPlayerDemo :: initState");
    super.initState();
    const String videoUrl =
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
    _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print("${Utility.TAG} :: VideoPlayerDemo :: setState");
    if (_controller.value.isCompleted) {
      print("${Utility.TAG} :: VideoPlayerDemo :: initState :: isCompleted");
      _controller.seekTo(const Duration(
        days: 0,
        hours: 0,
        minutes: 0,
        seconds: 0,
        milliseconds: 0,
        microseconds: 0,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
            Utility.addVerticalSpace(),
            MaterialButton(
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
