# Lingo Panda Assignment - News App

This project is a simple news app built using Flutter and Firebase, designed as part of a technical interview challenge. The app allows users to authenticate using Firebase Authentication (email), fetch news headlines from the News API, and stores user details in Firestore.

## Screenshots
<img width="200" alt="Screenshot 2024-09-19 at 21 13 37" src="https://github.com/user-attachments/assets/21a8c993-0621-45c3-9be1-232964e9b901">
<img width="200" alt="Screenshot 2024-09-19 at 21 13 37" src="https://github.com/user-attachments/assets/a972deb5-09af-4ee5-a53e-fe7d9a2689e8">
<img width="200" alt="Screenshot 2024-09-19 at 21 13 37" src="https://github.com/user-attachments/assets/efc9c206-572d-4078-b832-1593f7cb599d">
<img width="200" alt="Screenshot 2022-09-19 at 21 13 37" src="https://github.com/user-attachments/assets/fd2dcee9-7492-4ecc-9ea4-83a7ac77dfd9">
<img width="200" alt="Screenshot 2022-09-19 at 21 13 37" src="https://github.com/user-attachments/assets/73a961fd-b16f-4d0f-a536-b2d9ec5e19fd">

## Demo Video

Click [here](https://drive.google.com/file/d/1cJX2cXrnOaeesIPROu54ADL5v5_OUbug/view?usp=sharing) to watch the demo video.


## Features

- **Firebase Authentication**: User authentication via email.
- **Firestore Integration**: User details (name and email) are stored in Firestore.
- **News Feed**: Displays the top headlines for a specified country, fetched from [NewsAPI.org](https://newsapi.org/).
- **State Management**: Handled using the `Provider` package.
- **Form Validation**: Basic validation for the sign-in and sign-up forms.
- **Error Handling**: Handles potential API and Firebase interaction exceptions gracefully.

## Screens

- **Authentication Screen**: Allows users to sign up or log in with their email.
- **News Feed Screen**: Displays top headlines from a country based on the API response.
  
## MVC Architecture

```bash
lib/
├── models/          # Contains data models for news articles and user details
├── views/           # UI screens and widgets for displaying data
├── controllers/     # Business logic, API calls, Firebase integration
├── providers/       # Contains providers for state management using Provider package
└── main.dart        # App entry point
