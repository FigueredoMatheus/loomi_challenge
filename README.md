# Loomi Challenge - Movie Streaming App

This project is a movie streaming application developed in Flutter (version 19.6) as part of a challenge for a job application. The app provides various features, from authentication to viewing and rating movies.

### Prerequisites

Make sure you have the Flutter SDK installed. For instructions on how to install Flutter, refer to the [official Flutter documentation](https://flutter.dev/docs/get-started/install).

## Installation

1. Clone this repository: `git clone https://github.com/FigueredoMatheus/loomi_challenge`
2. Navigate to the project directory: `cd loomi_challenge`
3. Install dependencies: `flutter pub get`
4. Connected device or emulator
5. Run the app: `flutter run`

## Usage

1. Open the application on your Android device.
2. If you already have an account, log in using your email and password. Otherwise, register a new user.
3. From the home screen, select the movie you want to watch
4. On the movie screen, you can pause, jump the video forward, backward, drag the progress bar, hide overlays (double tap), select subtitle and audio
5. Access the settings screen to modify your profile information or log out of your account.

## Key Features

### Key Features
### Authentication
- Login with email and password.
- Login via Google.
- User registration.
- Password recovery.
- **Note**: Apple login is not yet implemented.
### Home Screen
- Access to the user's profile.
- Display of available movies (cover, title, synopsis, most recent user comment, release date, genre, director).
- Movie rating options (like, dislike, super like).
- Share movie option.
- Access to movie comments.
- Button to watch the movie.
### Comments Screen
- Submit comments.
- Report comments from other users.
- Edit and delete user's own comments.
### User Profile
- Display user name and photo.
- Option to edit personal information.
- Delete account.
- Change password.
- Logout.
- View history of watched movies.
- Subscription plan information.
- **Note**: Profile photo isn't storaged
### Video Player
- Playback controls (pause, forward).
- Display video title and progress.
- Add subtitles.
- Access to movie comments.
