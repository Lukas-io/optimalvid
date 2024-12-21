# 📹 Video Streaming App

A cross-platform video streaming application built with Flutter, featuring a clean interface and smooth video playback experience.

## Features

* **Video Library**: Browse through a curated list of videos with thumbnails, titles, and detailed descriptions
* **Smart Search**: Quickly find videos using the title search functionality
* **Built-in Player**: Enjoy seamless video playback with our custom in-app video player
* **Interaction System**: Like your favorite videos and maintain preferences with local storage
* **Offline Access**: Download and watch one video offline (optional feature)

## Getting Started

### Backend Setup

1. Clone the backend repository:
   ```bash
   git clone <repo-link>
   cd backend
   ```

2. Install required dependencies:
   ```bash
   npm install
   ```

3. Start the server:
   ```bash
   npm start
   ```

The backend server will be running at `http://localhost:3000`.

### Frontend Setup

1. Clone the frontend repository:
   ```bash
   git clone <repo-link>
   cd frontend
   ```

2. Install Flutter dependencies:
   ```bash
   flutter pub get
   ```

3. Launch the application:
   ```bash
   flutter run
   ```

## API Documentation

### Endpoints

#### Get Videos
```
GET /videos
```

Sample Response:
```json
[
  {
    "id": "1",
    "title": "Sample Video 1",
    "description": "This is a sample description for video 1.",
    "thumbnail": "https://example.com/thumbnail1.jpg",
    "videoUrl": "https://example.com/video1.mp4",
    "likes": 0
  }
]
```

## Project Structure

```
.
├── backend/              # API server
├── frontend/             # Flutter app
│   ├── lib/              
│   │   ├── main.dart     # Entry point
│   │   ├── screens/      # UI screens
│   │   ├── models/       # Data models
│   │   └── services/     # API calls using Dio
```

## Technologies

* [Flutter](https://flutter.dev/) - UI framework
* [Dio](https://pub.dev/packages/dio) - HTTP client for API requests
* [video_player](https://pub.dev/packages/video_player) - Video playback functionality

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

Wisdom

## Acknowledgments

* Flutter team for the amazing framework
* Contributors who help improve this project
* Video content creators
