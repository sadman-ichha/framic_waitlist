# Framic Waitlist Project README

## Overview

This project is a **Flutter** application for a clean, responsive **waitlist page** with an animated **splash screen**. It includes signup forms with client-side validation, dark mode support, and a live user counter.

The app is **cross-platform** and works on:

* **Mobile**: iOS & Android
* **Web**: Desktop & Mobile browsers

## Features

* **Splash Screen**: Animated splash screen before loading the waitlist page.
* **Waitlist Page**:

  * Landing Section: Headline, subtext, CTA button.
  * Form: Name (optional), Email (required) with validation.
  * Form States: Loading, Success, Error.
  * Live Counter: Shows number of users who have joined (mocked API).
  * Dark Mode Toggle.
* **Responsive Design**: Mobile-first design that also adapts to tablets and desktop.
* **Mock API**: Local POST `/signup` and GET `/users/count`.

## Folder Structure

```
lib/
├── main.dart                  # Entry point
├── core/                      # Theme, utils, shared widgets
│   ├── constants/
│   ├── theme/
│   ├── widgets/
│   └── utils.dart
├── features/
│   ├── waitlist/
│   │   ├── data/              # Mock API service
│   │   ├── models/            # User models
│   │   ├── provider/          # State management
│   │   └── views/             # Pages & widgets
│   └── splash/
│       ├── provider/          # Splash state management
│       └── views/             # Splash UI
```

## API Assumptions (Mocked)

* **POST `/signup`**

  * Request: `{ "name": "optional", "email": "required" }`
  * Response: `{ "success": true }` after simulated delay.
* **GET `/users/count`**

  * Response: `{ "count": <integer> }` starting from random number, increments on each signup.
* **Note**: These APIs are fully mocked locally; no backend required.

## Getting Started

### Prerequisites

* Flutter SDK >= 3.7
* Android Studio / Xcode (for mobile)
* Chrome, Edge, or any modern browser (for web)
* Git

### Run Locally

#### Web

```bash
git clone <your-repo-url>
cd framic_waitlist
flutter pub get
flutter run -d chrome
```

#### Android

```bash
flutter run -d android
```

#### iOS

```bash
flutter run -d ios
```

> Make sure a device or emulator/simulator is connected.

### Build for Production

#### Web

```bash
flutter build web --release
```

* Compiled files will be in `build/web/`
* Deploy using GitHub Pages or any web hosting.
* **Live Demo**: [https://your-username.github.io/your-repo](https://sadman-ichha.github.io/framic/)

#### Android

```bash
flutter build apk --release
```

* Output APK can be installed or submitted to Play Store.

#### iOS

```bash
flutter build ios --release
```

* Output can be submitted to App Store. (Requires Mac + Xcode)

## Screenshots

### Mobile & Webframic

![Mode](assets/screenshots/framic_screen.png)

## Notes

* Form validation ensures email is required and properly formatted.
* Dark mode toggle state persists during session.
* Live counter updates with each signup (mock logic).
* Splash screen appears before waitlist page.
* Fully cross-platform: Web, Android, iOS.

---

**Enjoy building and deploying your Flutter waitlist app across Web, iOS, and Android! **

---
