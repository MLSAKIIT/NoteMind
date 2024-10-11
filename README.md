# NoteMind: Note-Taking and Mind Mapping Application

## Introduction

**Project Overview**:  
NoteMind is a Flutter application that allows users to take notes, both typed and handwritten, and visually organize their thoughts using a mind map. This application is designed for students, professionals, and anyone looking to improve their productivity and organization.

## Technologies Used

- **Flutter**: Framework for building the application.
- **Dart**: Programming language used in Flutter.
- **Provider**: State management solution.
- **SQLite**: Local storage for notes.
- **TensorFlow Lite**: For handwriting recognition.

## Installation

### Prerequisites

1. **Flutter SDK (>=2.0.0)**: Ensure you have the Flutter SDK installed. You can download it from [Flutter's official website](https://flutter.dev/docs/get-started/install).
2. **Dart SDK**: Comes bundled with Flutter.
3. **IDE**: Install Android Studio or VS Code with Flutter and Dart plugins.

### Setup Instructions

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-repo/note_mind.git
   cd note_mind

2. **Install dependencies**:
   ```bash
   flutter pub get

3. **Run the application**:
   ```bash
   flutter run
   
### Architecture Overview

**Project Structure**:
   ```bash
   /note_mind
│
├── android
├── ios
├── lib
│   ├── models
│   │   ├── note.dart
│   │   └── mind_map.dart
│   ├── providers
│   │   └── note_provider.dart
│   ├── views
│   │   ├── home_screen.dart
│   │   ├── note_screen.dart
│   │   ├── login_screen.dart
│   │   ├── signup_screen.dart
│   │   └── profile_screen.dart
│   ├── widgets
│   │   ├── note_card.dart
│   │   ├── mind_map_widget.dart
│   │   └── custom_text_field.dart
│   ├── services
│   │   └── handwriting_recognition_service.dart
│   ├── main.dart
│   └── utils
│       └── database_helper.dart
└── test
  
### Design Patterns
 - **Provider**: For state management
 - **Repository Pattern**: To manage data operations.
 
### Features

**Core Features**

- **Note Creation**: Users can create, edit, and delete notes.
- **Handwritten Input**: Capture handwritten notes using a stylus or finger, which are converted to text using handwriting recognition.
- **Mind Mapping**: Visual representation of thoughts linked to notes.
- **Search Functionality**: Quickly find notes by keywords.

**User Intterface**

- **Home Screen**: Displays a list of notes and buttons for creating new notes or mind maps.
- **Note Screen**: Interface for creating/editing notes, including options for handwriting input.
- **Mind Map Screen**: Visual layout of related notes in a mind map format.

### Code Documentation

**Models**

- **note.dart**: Defines the Note class with properties like title, content, and timestamp.
- **mind_map.dart**: Defines the MindMap class with connections between notes.

**Handwriting Recognition**

- **handwriting_recognition_service.dart**: Contains logic to handle the conversion of handwritten notes to text using TensorFlow Lite.

**Example of Note Model**
class Note {
  final int id;
  final String title;
  final String content; // This will store converted text
  final DateTime timestamp;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.timestamp,
  });
}

### Testing
**Testing Frameworks**
  - Flutter Test for unit and widget tests.
**Running Tests**
  - To run unit tests:
    ```bash
    flutter test

### Deployment
**Build Instructions**
  - To build the application for Android:
    ```bash
    flutter build apk

  - For iOS, ensure you have a valid provisioning profile and run:
    ```bash
    flutter build ios

**App Store Submission**
Refer to the official documentation for guidelines on submitting to the App Store and Google Play.

### Troubleshooting
**Common Issues**
  **Error: "Unable to locate package"**: Ensure all dependencies are correctly listed in pubspec.yaml.
  **Database Issues**: Verify that SQLite is properly configured.
  **Handwriting Recognition Issues**: Ensure TensorFlow Lite models are correctly integrated.
**FAQs**
   **How do I back up my notes?**
   Use the export feature in the app to save notes as text files.

### Contributing
**Contribution Guidelines**
1. Fork the repository.
2. Create a new branch (git checkout -b feature/YourFeature).
3. Make your changes and commit them (git commit -m 'Add some feature').
4. Push to the branch (git push origin feature/YourFeature).
5. Open a pull request.
**License**
This project is licensed under the MIT License. See the LICENSE file for details.
**Additional Resources**
   - Flutter Documentation
   - SQLite Flutter Plugin
   - TensorFlow Lite Flutter Plugin

### Issues :
**Login Page**: 
   - Password obscure
   - Data collection
   - TextField border color
**Sign up Page**:
   - Password and confirm password (password confirmation check)
   - Password length and characters verification
   - TextField border color
**Profile Page**:
   - Editing profile details
   - Back button
**Routing**
**Theme**:
   - Light theme



