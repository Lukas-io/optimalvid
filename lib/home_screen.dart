import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optimalvid/api_controller.dart';

import 'package:optimalvid/video_model.dart';
import 'package:optimalvid/video_player_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<VideoModel> videos = [];
  List<VideoModel> searchVideos = [];

  @override
  void initState() {
    super.initState();
    getVideos();
  }

  void getVideos() async {
    videos = await fetchVideos();
    setState(() {
      searchVideos = videos;
    });
  }

  void updateList(String text) {
    searchVideos = [];
    for (var video in videos) {
      print(video);
      if (video.title.contains(text) || video.description.contains(text)) {
        searchVideos.add(video);
      }
    }

    if (text.isEmpty) {
      searchVideos = videos;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('OptimalVid'),
        ),
        body: Column(children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: SearchBar(
                elevation: WidgetStatePropertyAll(1.0),
                shadowColor:
                    WidgetStatePropertyAll(Colors.grey.withOpacity(.05)),
                backgroundColor:
                    WidgetStatePropertyAll(Colors.grey.withOpacity(.10)),
                leading: const Icon(
                  CupertinoIcons.search,
                ),
                hintText: "Search",
                onChanged: (text) {
                  setState(() {
                    updateList(text);
                  });
                },
              )),
          const SizedBox(
            height: 16.0,
          ),
          Expanded(
            child: videos.isEmpty
                ? const Center(child: CircularProgressIndicator.adaptive())
                : searchVideos.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.search,
                            size: 80.0,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Text("There are no videos that match that search",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: GridView.builder(
                          itemCount: searchVideos.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 16.0,
                                  crossAxisSpacing: 12.0),
                          itemBuilder: (context, index) {
                            VideoModel video = searchVideos[index];

                            return InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          VideoPlayerScreen(video))),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        video.thumbnail,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12.0,
                                  ),
                                  Text(video.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                  Text(
                                    video.description,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
          )
        ]));
  }
}
