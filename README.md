# Audioz Music Streaming App

## Table of Contents
1. Introduction
2. Features
3. Installation
4. Usage
5. Contributing
6. License

## Introduction
This is a music streaming app built with Flutter and uses the YouTube API for streaming music. It allows users to search for their favorite songs and play them directly from YouTube.

## Features
- **Search Functionality**: Allows users to search for their favorite songs.
- **Music Streaming**: Streams music directly from YouTube.
- **Playlist Management**: Users can create, edit, and delete their own playlists.
- **User Authentication**: Users can register and login to save their playlists and preferences.

## Installation
To get started with this project, do the following:

1. Make sure you have Flutter installed on your machine. If not, visit the Flutter website for installation instructions.
2. Clone this repository: `git clone https://github.com/jonathancaleb/audioz/tree/main.git`
3. Install the dependencies: `flutter pub get`
4. Create a new project on the Google Cloud Console and enable the YouTube Data API v3. Obtain the API key and replace `YOUR_API_KEY` in the `lib/config.dart` file with your actual API key.
5. Build the project: `flutter build apk --release`

## Usage
To run the app on your device, do the following:

1. Connect your device to your computer.
2. Run the app: `flutter run`

## Contributing
We welcome contributions from the community. If you wish to contribute, please take a moment to review our **Contributing Guidelines**.

## License
This project is licensed under the MIT License. See the **LICENSE** file for more details