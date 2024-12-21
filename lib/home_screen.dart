import 'package:flutter/material.dart';
import 'package:optimalvid/api_controller.dart';
import 'package:optimalvid/video_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<VideoModel>> videos;

  @override
  void initState() {
    super.initState();
    videos = fetchVideos(); // Fetch videos on initialization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OptimalVid')),
      body: SingleChildScrollView(
        child: FutureBuilder<List<dynamic>>(
          future: videos,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final videoList = snapshot.data!;
              return ListView.builder(
                itemCount: videoList.length,
                itemBuilder: (context, index) {
                  final video = videoList[index];
                  return ListTile(
                    leading: Image.network(video['thumbnail']),
                    title: Text(video['title']),
                    subtitle: Text(video['description']),
                    onTap: () {
                      // Navigate to a video player screen
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
