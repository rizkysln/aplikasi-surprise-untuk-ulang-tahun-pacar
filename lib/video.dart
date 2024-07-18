import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatelessWidget {
  final List<String> _videoAssetPaths = [
    'assets/video/video1.mp4',
    'assets/video/video2.mp4',
    'assets/video/video3.mp4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Kenangan'),
      ),
      body: ListView.builder(
        itemCount: _videoAssetPaths.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: VideoPlayerWidget(videoAssetPath: _videoAssetPaths[index]),
            ),
          );
        },
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoAssetPath;

  VideoPlayerWidget({required this.videoAssetPath});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoAssetPath)
      ..initialize().then((_) {
        setState(() {}); // Ketika video diinisialisasi, perbarui state untuk menampilkan video
      });
    _initializeVideoPlayerFuture = _controller.initialize(); // Inisialisasi future
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                VideoPlayer(_controller),
                _ControlsOverlay(controller: _controller),
                VideoProgressIndicator(_controller, allowScrubbing: true),
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key? key, required this.controller}) : super(key: key);

  static const List<IconData> _icons = [Icons.play_arrow, Icons.pause];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.value.isPlaying ? controller.pause() : controller.play();
      },
      child: Stack(
        children: <Widget>[
          Center(
            child: Icon(
              controller.value.isPlaying ? _icons[1] : _icons[0],
              color: Colors.white,
              size: 50.0,
            ),
          ),
        ],
      ),
    );
  }
}
