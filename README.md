# Smart Home Control App

A Flutter application with Firebase integration that provides complete home automation control, including lighting, water systems, and environmental monitoring.

## Features

- **Home Automation Control**:
  - Control lights (indoor/outdoor)
  - Manage water systems
  - Monitor and control garden irrigation
  - Farm animal care systems

- **Environmental Monitoring**:
  - Real-time temperature tracking
  - Humidity level monitoring
  - Gas level detection
  - Multi-zone monitoring (Home, Garden, Farm)

- **Smart Notifications**:
  - Real-time alerts for abnormal conditions
  - System status updates
  - Threshold-based notifications

- **User Authentication**: Secure login and account creation using Firebase Authentication
- **Cross-Platform**: Supports Android, iOS, Web, Windows, macOS, and Linux
- **Responsive UI**: Beautiful and intuitive interface for all devices

## Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (included with Flutter)
- Firebase account and project setup with:
  - Realtime Database enabled
  - Authentication methods configured
  - Cloud Messaging set up for notifications
- Physical/virtual devices for testing:
  - Mobile (Android/iOS) for remote control
  - IoT devices for home automation integration
- Android Studio / VS Code with Flutter extensions (recommended)

## Setup Instructions

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd home
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   - Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Add Android/iOS/Web app to your Firebase project
   - Download the configuration files:
     - `google-services.json` for Android
     - `GoogleService-Info.plist` for iOS
   - Place these files in the appropriate directories:
     - Android: `android/app/google-services.json`
     - iOS: `ios/Runner/GoogleService-Info.plist`

4. **Run the app**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── Accueil.dart         # Main dashboard with home automation controls
│   ├── Home Tab: Main control panel with status overview
│   ├── Garden Tab: Garden monitoring and controls
│   └── Farm Tab: Farm animal care systems
├── CreatAccount.dart    # Account creation screen
├── LoginPage.dart       # Login screen
├── api/
│   └── firebase_api.dart # Firebase API integration and real-time data
├── notification.dart    # Notification UI components
├── notification_service.dart # Notification handling service
└── main.dart           # App entry point and initialization
```

## Dependencies

- `firebase_core`: ^2.30.1 - Core Firebase functionality
- `firebase_auth`: ^4.19.4 - User authentication
- `firebase_database`: ^10.5.4 - Real-time data synchronization
- `firebase_messaging`: ^14.9.1 - Push notifications
- `flutter_local_notifications`: ^17.1.2 - Local device notifications
- `cupertino_icons`: ^1.0.6 - iOS-style icons
- `provider`: ^6.0.5 - State management
- `shared_preferences`: ^2.2.2 - Local storage for settings

## Home Automation Setup

### 1. Device Pairing
1. Ensure all smart devices are powered on and in pairing mode
2. Open the app and navigate to Settings > Device Management
3. Tap "Add New Device" and follow the on-screen instructions
4. Assign devices to appropriate rooms (Home, Garden, Farm)

### 2. Automation Rules
1. Go to Automation tab
2. Create custom rules for:
   - Light scheduling
   - Watering schedules
   - Temperature-based triggers
   - Notification preferences

### 3. Monitoring Dashboard
- Real-time status of all connected devices
- Historical data and analytics
- Energy consumption tracking

## Building for Production

### Android
```bash
flutter build apk --release
# or
flutter build appbundle
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For support, please open an issue in the repository or contact the maintainers.
