const express = require('express');
const cors = require('cors');
const app = express();

// Middleware
app.use(cors());
app.use(express.json());

// Mock Data (Video List)
const videos = [
[
  {
    "id": 1,
    "title": "The INSANE Tech behind MrBeast's Biggest Video Ever",
    "description": "An in-depth look at the technology used in MrBeast's latest video.",
    "thumbnail": "https://i.ytimg.com/vi/-hlwlML6pEg/maxresdefault.jpg",
    "videoUrl": "https://www.youtube.com/watch?v=-hlwlML6pEg",
  },
  {
    "id": 2,
    "title": "I Copied MrBeast's Video & Went Viral",
    "description": "Exploring the strategy behind MrBeast's viral videos.",
    "thumbnail": "https://i.ytimg.com/vi/TeNtNPCTNgo/maxresdefault.jpg",
    "videoUrl": "https://www.youtube.com/watch?v=TeNtNPCTNgo",
  },
  {
    "id": 3,
    "title": "YouTube Rewind 2022 TECH Edition ft. MKBHD, Linus Tech Tips",
    "description": "A tech-focused rewind of 2022 featuring top tech YouTubers.",
    "thumbnail": "https://i.ytimg.com/vi/OPe7DxUHD04/maxresdefault.jpg",
    "videoUrl": "https://www.youtube.com/watch?v=OPe7DxUHD04",
  },
  {
    "id": 4,
    "title": "YouTube Made MrBeast A Custom Award for 200 MILLION",
    "description": "MrBeast showcases the custom award YouTube made for his 200 million subscribers milestone.",
    "thumbnail": "https://i.ytimg.com/vi/-tUc1Ft1w9g/maxresdefault.jpg",
    "videoUrl": "https://www.youtube.com/watch?v=-tUc1Ft1w9g",
  },
  {
    "id": 5,
    "title": "Recreating One Of MKBHD's Best Thumbnails",
    "description": "A tutorial on how to recreate one of MKBHD's most iconic thumbnails.",
    "thumbnail": "https://i.ytimg.com/vi/mCQ0D1sS8yM/maxresdefault.jpg",
    "videoUrl": "https://www.youtube.com/watch?v=mCQ0D1sS8yM",
  }
]
];

// Routes
app.get('/api/videos', (req, res) => {
  res.json(videos);
});

app.post('/api/videos/:id/like', (req, res) => {
  const video = videos.find(v => v.id === parseInt(req.params.id));
  if (video) {
    video.likes += 1;
    res.json(video);
  } else {
    res.status(404).send("Video not found");
  }
});

// Start the server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));