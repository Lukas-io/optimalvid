📹 Video Streaming App

A cross-platform video streaming app built with Flutter.

Features

View a list of videos with thumbnails, titles, and descriptions.
Search videos by title.
Play videos using an in-app video player.
Like videos and save preferences locally.
(Optional) Offline playback for one video.
Getting Started

Backend Setup
Clone the backend:
git clone <repo-link>
cd backend
Install dependencies:
npm install
Start the server:
npm start
Backend runs on http://localhost:3000.
Frontend Setup
Clone the frontend:
git clone <repo-link>
cd frontend
Install Flutter dependencies:
flutter pub get
Run the app:
flutter run
API Overview

Endpoint:
GET /videos
Sample Response:
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
Folder Structure

.
├── backend/              # API server
├── frontend/             # Flutter app
│   ├── lib/              
│   │   ├── main.dart     # Entry point
│   │   ├── screens/      # UI screens
│   │   ├── models/       # Data models
│   │   └── services/     # API calls using Dio
Tools Used

Dio: For API calls.
video_player: To play videos.

Author
Wisdom
