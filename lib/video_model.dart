class VideoModel {
  final int id;
  final String title;
  final String description;
  final String thumbnail;
  final String videoUrl;

  const VideoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.videoUrl,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
        videoUrl: json["videoUrl"],
        id: json["id"],
        title: json["title"],
        description: json["description"],
        thumbnail: json["thumbnail"]);
  }
}
