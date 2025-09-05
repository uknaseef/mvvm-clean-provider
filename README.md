# **_✨ Mvvm Clean Provider Project ✨_**

## 🛠️ Requirements

To successfully run and develop the Mobile App, ensure you have the following versions of tools and dependencies:

| **🔧 Tool**                | **📦 Version**                          |
| -------------------------- | --------------------------------------- |
| **Flutter SDK**            | `3.29.1`                               |
| **Dart SDK**               | `3.7.0`                                |
| **DevTools Version**       | `2.42.2`                               |
| **Android SDK Version**    | `35.0.0`                               |
| **build-tools**            | `35.0.0`                               |
| **Gradle**                 | `8.10.2`                               |
| **Android Studio Version** | `Android Studio Koala 2024.1.1 Patch 1`|
| **VSCODE Version**         | `1.85.1`                               |
| **XCode Version**          | `15.3`                                 |
| **Cocoapods Version**      | `1.16.2`                               |

## 🏗️ Project Architecture

The App follows a modular, **MVVM (Model-View-ViewModel)** architecture pattern, promoting clean code principles, separation of concerns, and scalability.

## 🧰 Tech Stack

The following technologies and tools are used to build and maintain the Mobile App:

| **📂 Category**           | **🔨 Technology/Tool**            |
| ------------------------- | --------------------------------- |
| **State Management**      | [Provider]                       |
| **Networking**            | [Dio]                            |
| **Local Storage**         | [Sembast]                        |
| **Dependency Injection**  | [GetIt]                          |
| **Routing**               | [Flutter Default Route Manager]  |
| **Testing**               | [Flutter Test]                   |
| **Version Control**       | [Git]                            |
| **IDE**                   | [Android Studio], [VS Code]      |
| **iOS Development**       | [Xcode]                          |
| **iOS Package Manager**   | [CocoaPods]                      |
| **Android Build Tool**    | [Gradle]                         |

---

### 📂 **Directory Structure**

```bash
mobile_app/
│
├── README.md                 # 📘 Project documentation
├── CHANGELOG.md              # 📝 Version history and changes
├── CODING_STANDARDS.md       # 📏 Coding Standards to follow
├── GIT_COMMIT_STANDARDS.md   # 🖊️ Git commit Standards to follow
├── pubspec.yaml              # ⚙️ Project configuration and dependencies
├── android/                  # 🤖 Android-specific code and configurations
├── ios/                      # 🍎 iOS-specific code and configurations
├── test/                     # 🧪 Unit and widget tests
├── lib/                      # 🏗️ Main application code
│   ├── main.dart             # 🚀 Entry point of the application
│   ├── data/                 # 📊 Data layer of the app
│   │   ├── local/            # 🗂️ Local data sources (e.g., SQLite, SharedPreferences, etc.)
│   │   └── remote/           # 🌐 Remote data sources (e.g., APIs)
│   ├── res/                  # 🎨 Resources like constants, enums, styles
│   │   ├── constants/        # 🔑 Constant values used throughout the app
│   │   ├── enums/            # 🗂️ Enumeration types
│   │   └── styles/           # 🎨 Styling resources
│   │       └── fonts/        # ✍️ Font styles
│   ├── services/             # 🛠️ Services for app engagement (e.g., Firebase, Onesignal)
│   ├── src/                  # 📦 Core source code
│   │   ├── main/             # 🏗️ Main application code
│   │   │   ├── model/        # 🗂️ Data models
│   │   │   ├── repo/         # 📂 Repositories for data access
│   │   │   ├── view/         # 🖼️ UI components and screens
│   │   │   │   └── widgets/  # 🧩 Widgets for specific screens
│   │   │   └── view_model/   # 🧠 Business logic and state management
│   ├── utils/                # 🛠️ Utility classes and functions
│   │   ├── helpers/          # 🧰 Helper functions and utilities
│   │   ├── common_widgets/   # 🧩 Reusable widgets
│   │   ├── common_model/     # 📂 Reusable Models
│   │   └── routes/           # 🛤️ Routing and navigation
│   │       └── arguments/    # 📦 Route argument classes
├── shufitpro_onsite_sdk/     # 🔒 For KYC Verification
├── assets/                   # 🖼️ To store images, icons, and other static resources
│   ├── images/
│   ├── icons/
│   └── fonts/
```

---

## 📝 Naming Conventions

| **🔤 Element**              | **📖 Convention**   |        **Example** |
| :-------------------------- | :----------------- | -----------------: |
| `Project and Directory`     | snake_case         | my_flutter_project |
| `Dart File Names`           | snake_case         |    user_model.dart |
| `Class Names`               | PascalCase         |        UserProfile |
| `Function and Method Names` | lowerCamelCase     |        fetchData() |
| `Variable Names`            | lowerCamelCase     |           userName |
| `Constants`                 | lowerCamelCase     |            appName |
| `Widget Names`              | PascalCase         |       CustomButton |
| `Enum Names`                | PascalCase         |     UserRole.Admin |
| `Private Members`           | \_lowerCamelCase   |      \_fetchData() |
| `Future/Async Methods`      | lowerCamelCaseAsync|     getDataAsync() |
| `State Management Classes`  | PascalCase         |      AuthViewModel |
| `BLoC Events`               | PascalCase         | AddItemToCartEvent |
| `Screen Names`              | PascalCase         |         HomeScreen |
| `Route Names`               | lowerCamelCase     |      '/homeScreen' |

