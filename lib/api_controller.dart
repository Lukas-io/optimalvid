import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:optimalvid/constants.dart';
import 'package:optimalvid/video_model.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2,
    // Number of method calls to include in the log trace
    errorMethodCount: 8,
    // Number of method calls to include for errors
    lineLength: 120,
    // Wrap lines longer than this
    colors: true,
    // Colorful log messages
    printEmojis: true,
    // Print emojis for log levels
    printTime: true, // Include a timestamp in the logs
  ),
);

Future<List<VideoModel>> fetchVideos() async {
  const String apiUrl = getVideos;
  final Dio dio = Dio();

  try {
    // Make the GET request
    final Response response = await dio.get(apiUrl);

    // Check if the response is successful
    if (response.statusCode == 200) {
      List<VideoModel> videos = response.data
          .map(
            (video) => VideoModel.fromJson(video),
          )
          .toList();
      logger.i('Successfully fetched ${videos.length} videos'); // Log success
      return videos;
    } else {
      logger.e(
          'Failed to fetch videos. Status code: ${response.statusCode}'); // Log error
      throw Exception('Failed to fetch videos');
    }
  } on DioException catch (e) {
    logger.e('Dio Exception: ${e.message}', error: e); // Log Dio-specific error
    throw Exception('Error fetching videos: ${e.response?.data ?? e.message}');
  } catch (error) {
    logger.e('General error: $error'); // Log general errors
    throw Exception('Error fetching videos');
  }
}
