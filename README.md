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

## Folder Structure

This Flutter app follows a structured and organized folder system to maintain code readability, scalability, and manageability. Below is the breakdown of the folder structure and their respective purposes:

### Common
- **Utils**: Contains utility functions and helpers that are commonly used across the application.
- **Widgets**: Reusable widgets that are used in various parts of the app.

### Core
- **Data**: Responsible for data handling, including data sources and repositories.
- **Helpers**: Contains helper classes and functions that support the core functionalities.
- **Routes**: Manages navigation and routing within the application.
- **Services**: Includes essential services required for the app to function, such as API services, local storage, etc.
- **Themes**: Manages the theming and styling of the app, including color schemes, typography, and other UI elements.

### Models
- **Entity**: Classes representing the entities used throughout the app.
- **Response**: Handles the data structures for responses from network requests.

### Modules
Each module represents a feature or a specific part of the app, and is further divided into:
- **Controller**: Manages the business logic of the module.
- **Store**: Handles the state management for the screens within the module.
- **View**: Contains the UI screens of the module.
- **Widgets**: Specific widgets used within the module's views.

### Repositories
Responsible for making network calls and fetching data from APIs or other data sources.

### Services
Processes the responses from repositories, including error handling and data manipulation before it is used by the app.

---

## Modules Overview

### Movie Player
- **Description**: This module is where the selected movie is displayed to the user.
- **State Management**: MobX is used for state management.

### Home
- **Description**: The home module allows users to view movies and access their profile.
- **State Management**: BLoC is used for state management.

### Comments
- **Description**: This module enables users to view comments on the selected movie. Users can also add, edit, delete their comments, and report third-party comments.
- **State Management**: MobX is used for state management.

### Create Account
- **Description**: This module allows users to register an account.
- **State Management**: GetX is used for state management.

### Login
- **Description**: Users can log in using email/password or through Google. Apple login is also available but currently not functioning.
- **State Management**: GetX is used for state management.

### Forgot Password
- **Description**: Users can recover their password by providing their email. Currently, there is an issue with the email sending, resulting in a timeout error.
- **State Management**: GetX is used for state management.

### User Profile
- **Description**: This module allows users to view and edit their profile information, change their password, delete their account, and log out.
- **State Management**: MobX is used for state management.

---

## State Management Libraries

- **MobX**: Used for reactive state management, allowing the UI to automatically react to data changes.
- **BLoC**: Utilized in the Home module for clearer separation between UI and business logic, with unidirectional data flow.
- **GetX**: Implemented in the Login and Forgot Password modules, providing a simple and efficient approach to state management with reactivity.

---

## Routes

Navigation within the app is handled using GetX. Below are the defined routes:
- `LOGIN_PAGE_VIEW` = '/login-page_view'; (Navigates to the login page)
- `CREATE_ACCOUNT_PAGE_VIEW` = '/create-account-page-view'; (Navigates to the create account page)
- `FORGOT_PASSWORD_PAGE_VIEW` = '/forgot-password-page-view'; (Navigates to the forgot password page)
- `SUCCES_ON_SEND_RESENT_EMAIL_PAGE_VIEW` = '/success-on-send-resent-email-page-view'; (Navigates to the page shown when the recovery email is successfully sent)
- `HOME_PAGE_VIEW` = '/home-page-view'; (Navigates to the home page)
- `USER_SETTINGS_PAGE_VIEW` = '/user-settings-page-view'; (Navigates to the user profile page)
- `CHANGE_USER_PASSWORD_PAGE_VIEW` = '/change-user-password-page-view'; (Navigates to the change password page)
- `EDIT_PROFILE_PAGE_VIEW` = '/edit-profile-page-view'; (Navigates to the edit user information page)
- `MOVIE_PLAYER_PAGE_VIEW` = '/movie-player-page-view'; (Navigates to the movie player page)
- `USER_SUBSCRIPTION_PAGE_VIEW` = '/user-subscription-page-view'; (Navigates to the user subscription information page)
- `MOVIE_COMMENTS_PAGE_VIEW` = '/mobie-comments-page-view'; (Navigates to the movie comments page)

---

## Helpers

The **Helpers** folder contains classes that assist with various tasks throughout the app, including:
- **Exception Handling**: Classes that manage exceptions arising from requests.
- **Permissions**: Classes that handle permissions for camera and gallery usage.
- **Serialization**: Classes that assist with JSON serialization and deserialization (`toJson` and `fromJson`).
- **Validation**: Classes that validate text field inputs.
- **Image Handling**: Classes that manage device images, including capturing photos using the camera or selecting photos from the gallery.

---

## Known Issues

- **Apple Login**: Currently not functioning.
- **Forgot Password Email**: The email sending process is experiencing a timeout error.

