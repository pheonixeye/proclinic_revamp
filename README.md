# ProClinic Revamp

A modern Flutter clinic management application - a complete revamp of the ProCliniC app. Built with a clean, modular architecture to support multi-language, PDF reporting, and flexible state management.

## Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Internationalization (i18n)](#internationalization-i18n)
- [Assets](#assets)
- [Available Scripts & Commands](#available-scripts--commands)
- [Development Notes](#development-notes)
- [Contributing](#contributing)
- [License](#license)

## Features

- **Multi-language Support**: Full internationalization with Arabic and English support using Flutter's built-in localization.
- **State Management**: Robust state management powered by [Provider](https://pub.dev/packages/provider).
- **Type-safe Navigation**: Declarative routing using [go_router](https://pub.dev/packages/go_router).
- **PDF Generation & Printing**: Generate and print professional reports using [pdf](https://pub.dev/packages/pdf) and [printing](https://pub.dev/packages/printing).
- **Data Persistence**: Local storage for user preferences with [shared_preferences](https://pub.dev/packages/shared_preferences).
- **File Handling**: File selection and management with [file_picker](https://pub.dev/packages/file_picker).
- **Database Integration**: MongoDB connectivity via [mongo_dart](https://pub.dev/packages/mongo_dart).
- **Custom Theming**: Consistent UI with Google Fonts and Material Design 3.
- **Cross-platform**: Supports Linux and Windows platforms.

## Tech Stack

| Technology | Version | Purpose |
|------------|---------|---------|
| [Flutter](https://flutter.dev/) | ^3.10.4 | UI framework |
| [Dart](https://dart.dev/) | SDK ^3.10.4 | Programming language |
| [Provider](https://pub.dev/packages/provider) | ^6.1.5+1 | State management |
| [go_router](https://pub.dev/packages/go_router) | ^18.0.2 | Navigation & routing |
| [intl](https://pub.dev/packages/intl) | ^0.20.2 | Internationalization & date formatting |
| [mongo_dart](https://pub.dev/packages/mongo_dart) | ^0.10.9 | MongoDB driver |
| [pdf](https://pub.dev/packages/pdf) | ^3.13.1 | PDF generation |
| [printing](https://pub.dev/packages/printing) | ^5.15.1 | PDF printing |
| [shared_preferences](https://pub.dev/packages/shared_preferences) | ^2.5.5 | Local data storage |
| [file_picker](https://pub.dev/packages/file_picker) | ^13.1.0 | File selection |
| [flutter_svg](https://pub.dev/packages/flutter_svg) | ^2.3.0 | SVG rendering |
| [google_fonts](https://pub.dev/packages/google_fonts) | ^8.2.1 | Typography |

## Prerequisites

Before you begin, ensure you have the following installed:

- [Flutter](https://docs.flutter.dev/get-started/install) SDK (version 3.10.4 or higher)
- [Dart](https://dart.dev/get-dart) SDK (comes with Flutter)
- An IDE (preferably [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio))

This project also supports [FVM](https://fvm.app/) for Flutter version management - see `.fvmrc` for the configured version.

## Getting Started

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd proclinic_revamp
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Set up environment variables**

   Check for a `.env` file in the root directory. If needed, create one based on your backend configuration.

4. **Run the application**

   ```bash
   flutter run
   ```

   You can specify the device with the `-d` flag:
   
   ```bash
   flutter run -d linux
   flutter run -d windows
   ```

## Project Structure

The project follows a modular, feature-based architecture:

```text
lib/
├── api/           # API services and network layer
├── constants/     # App constants, keys, and static data
├── extensions/    # Dart/Flutter extensions
├── localization/  # Localization configuration and delegates
├── main.dart      # Application entry point
├── models/        # Data models
├── pages/         # UI screens/pages
├── providers/     # State management providers
├── router/        # App routing configuration
├── theme/         # App theming, colors, and styles
├── utils/         # Utility functions and helpers
└── widgets/       # Reusable UI components
```

## Internationalization (i18n)

The app supports multiple languages configured via `l10n.yaml`:

- **Supported locales**: English (en), Arabic (ar)
- **Translation files**: Located in `assets/lang/`
- **Auto-generated**: Localization code is generated using Flutter's gen-l10n

To regenerate localization files after modifying ARB files:

```bash
flutter gen-l10n
```

## Assets

```text
assets/
├── images/   # Image assets
├── lang/     # Localization ARB files
├── json/     # JSON data/config files
└── sounds/   # Audio assets
```

## Available Scripts & Commands

| Command | Description |
|---------|-------------|
| `flutter pub get` | Install project dependencies |
| `flutter run` | Run the app in debug mode |
| `flutter build apk` | Build Android APK |
| `flutter build linux` | Build Linux application |
| `flutter build windows` | Build Windows application |
| `flutter test` | Run unit tests |
| `flutter analyze` | Run static analysis (linter) |
| `dart format .` | Format codebase |
| `flutter pub run build_runner build` | Run code generation (if using build_runner) |

## Development Notes

- **Code Style**: This project uses [flutter_lints](https://pub.dev/packages/flutter_lints) v6.0.0 for linting. Run `flutter analyze` to check for issues.
- **Version Management**: If using FVM, run commands with `fvm flutter ...` or ensure you're using the correct Flutter version.
- **Environment Config**: Application name is read from environment variables (`APPLICATION_NAME` in String.fromEnvironment).
- **Date Formatting**: The app initializes date formatting for both Arabic and English locales on startup.

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is proprietary and intended for internal use.