import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optimalvid/video_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final VideoModel videoModel;

  const VideoPlayerScreen(this.videoModel, {super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Extract the video ID from the YouTube URL
    final videoId = YoutubePlayer.convertUrlToId(widget.videoModel.videoUrl);

    // Initialize the YouTube player controller
    _controller = YoutubePlayerController(
      initialVideoId: videoId ?? '', // Use the extracted video ID
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        controlsVisibleAtStart: true,
        enableCaption: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    VideoModel video = widget.videoModel;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              onReady: () {
                print('Player is ready.');
              },
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(video.title,
                      style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    video.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
