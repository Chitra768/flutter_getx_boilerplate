# Flutter GetX Boilerplate

A clean and production-ready Flutter boilerplate built using GetX for state management, routing, and dependency injection.

This boilerplate helps developers start Flutter projects quickly with a scalable architecture and reusable components.

## ✨ Features

- GetX State Management
- GetX Routing
- Dependency Injection using GetX Bindings
- Modular Architecture
- Login & Register Flow
- Form Validation
- Password Show / Hide
- Phone Number Input Formatting
- API Integration with Dio
- Clean Code Structure
- Reusable Widgets

## 📁 Project Structure

```text
lib/
├── core/
│   ├── constants/    # App-wide constants (colors, strings, spacing)
│   ├── theme/        # App themes and text styles
│   ├── utils/        # Utility classes (validators, formatters)
│   └── widgets/      # Reusable UI components
│
├── data/
│   ├── models/       # Data models based on JSON
│   ├── repository/   # Repositories for handling data sources
│   └── services/     # API services and core services setup
│
├── modules/
│   ├── auth/         # Auth module (Login/Register)
│   └── home/         # Home module
│
├── routes/
│   ├── app_pages.dart    # Route mapping to views/bindings
│   └── app_routes.dart   # String constants for routes
│
└── main.dart         # Entry point
```

## 🚀 Getting Started

### 1️⃣ Clone the repository

```bash
git clone https://github.com/Chitra768/flutter_getx_boilerplate.git
```

### 2️⃣ Navigate to the project folder

```bash
cd flutter_getx_boilerplate
```

### 3️⃣ Install dependencies

```bash
flutter pub get
```

### 4️⃣ Run the project

```bash
flutter run
```

## 📱 Included Screens

This boilerplate includes ready-to-use authentication screens.

**Login Screen**

- Email validation
- Password validation
- Password visibility toggle
- Navigate to Register screen

**Register Screen**

- Name field
- Phone number input formatting
- Email validation
- Password validation
- Confirm password validation

**Home Screen**

- Basic starter screen after login
- Can be extended for your app features

## ➕ How to Add New Modules

Example: Adding a **Profile** Module

### 1. Create Folder

`lib/modules/profile/`

### 2. Create Files

- `profile_view.dart` → UI screen
- `profile_controller.dart` → Business logic using GetxController
- `profile_binding.dart` → Dependency injection for controller

### 3. Register Route

Add route inside `lib/routes/app_routes.dart`:

```dart
static const PROFILE = '/profile';
```

Then register it in `app_pages.dart`:

```dart
GetPage(
  name: Routes.PROFILE,
  page: () => const ProfileView(),
  binding: ProfileBinding(),
),
```

### 4. Navigate to Screen

```dart
Get.toNamed(Routes.PROFILE);
```

## 🔌 API Integration

This project uses **Dio** for API communication.

**Configure Base URL**

Open `lib/data/services/api_service.dart` and update the base URL.

**Add API Methods**

Example: `login()`, `register()`, `getUser()`

**Use Repository Pattern**

Inside `lib/data/repository/`, convert API responses into Dart models before sending them to controllers.

## 📦 Technologies Used

- Flutter
- GetX
- Dio (API Calls)
- MVC + Modular Architecture

## 🤝 Contribution

Contributions are welcome.

If you find this boilerplate helpful, please ⭐ star the repository.

## 👨‍💻 Author

Created to help Flutter developers quickly start scalable projects using GetX architecture.
