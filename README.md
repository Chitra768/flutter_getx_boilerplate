# Flutter GetX Boilerplate

A complete, production-ready Flutter boilerplate project using GetX for state management, routing, and dependency injection.

## 📁 Project Structure

```text
lib/
├── core/
│   ├── constants/    # App-wide constants (colors, strings, spacing)
│   ├── theme/        # App themes and text styles
│   ├── utils/        # Utility classes (validators, formatters)
│   └── widgets/      # Reusable UI components
├── data/
│   ├── models/       # Data models based on JSON
│   ├── repository/   # Repositories for handling data sources
│   └── services/     # API services and core services setup
├── modules/
│   ├── auth/         # Auth module (Login/Register)
│   └── home/         # Home module
├── routes/
│   ├── app_pages.dart    # Route mapping to views/bindings
│   └── app_routes.dart   # String constants for routes
└── main.dart         # Entry point
```

## 🚀 How to Run the Project

1. Clone or copy the project files to your local machine.
2. Make sure you have the Flutter SDK installed and environment setup.
3. Fetch the required dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```

## ➕ How to Add New Modules

Follow these steps to generate a new module (e.g., `Profile`):

1. **Create the Folder Structure:** Inside `lib/modules/`, create a folder named `profile/`.
2. **Create the Files:**
   - `profile_view.dart` (The UI wrapped in `GetView<ProfileController>`)
   - `profile_controller.dart` (Business logic, extending `GetxController`)
   - `profile_binding.dart` (Dependency Injection mapping the controller)
3. **Register the Route:**
   - Add `static const PROFILE = '/profile';` to `lib/routes/app_routes.dart`.
   - Add the new route to `app_pages.dart` inside the `routes` array:
     ```dart
     GetPage(
       name: Routes.PROFILE,
       page: () => const ProfileView(),
       binding: ProfileBinding(),
     ),
     ```
4. **Navigate:** Use `Get.toNamed(Routes.PROFILE);` to navigate to the new module.

## 🔌 How to Connect API

The project uses `Dio` for network requests to keep it production-ready.
1. Configure your base URL inside `lib/data/services/api_service.dart`.
2. Modify the methods (`login`, `register`, etc.) in `api_service.dart` to make actual POST/GET requests.
3. Optionally, add Interceptors in the `ApiService` initialization block to handle authentication tokens, refreshing, or global error handling.
4. Implement data parsing inside `lib/data/repository/` files to map responses to actual Dart models before sending them back to controllers.
