# PythonHub

A Flutter mobile app featuring 100 curated Python coding problems to help you prepare for senior engineer interviews.

## Features

- **100 Python Problems** across multiple categories (Arrays, Strings, Linked Lists, Trees, Dynamic Programming, etc.)
- **Problem Details** with difficulty level, description, constraints, and examples
- **Solutions** with clean, well-commented Python code and complexity analysis
- **Favorites** to bookmark problems for quick revision
- **Progress Tracking** with solved/completed statistics
- **Dark Theme** inspired by GitHub's dark mode

## Screenshots

| Home | Problem List | Detail | Solution |
|------|-------------|--------|----------|
| Home screen with categories and stats | Browse problems by category | Read problem statement and constraints | View Python solution and complexity |

## Getting Started

### Prerequisites

- [Flutter](https://docs.flutter.dev/get-started/install) SDK (>= 3.4.0)
- Android Studio / Xcode (for emulators)
- ADB (for physical Android devices)

### Run

```bash
flutter pub get
flutter run
```

### Build Release APK

```bash
./install.sh
```

This script:
1. Cleans the build
2. Fetches dependencies
3. Builds a release APK
4. Installs it on your connected Android device via ADB

## Project Structure

```
lib/
├── data/
│   └── problems.dart          # Problem dataset
├── models/
│   └── problem.dart           # Problem model
├── providers/
│   └── problem_provider.dart  # State management
├── screens/
│   ├── home_screen.dart
│   ├── problem_list_screen.dart
│   ├── problem_detail_screen.dart
│   ├── solution_screen.dart
│   └── favorites_screen.dart
└── main.dart
```

## Tech Stack

- **Flutter** — Cross-platform UI framework
- **Dart** — Programming language
- **Provider** — State management

## Platforms

- Android
- iOS
- macOS
- Windows
- Linux
- Web

## License

MIT
