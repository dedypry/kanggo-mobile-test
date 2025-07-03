# 📰 Kanggo News App

A Flutter mobile application that displays news articles fetched from a public API. Users can search for news, paginate through results, and mark articles as favorites.

---

---

## 📸 Screenshots

| Home View | Favorite View |
|-----------|---------------|
| ![Home](assets/sc2.jpeg) | ![Favorites](assets/sc1.jpeg) |

---

---

## 🚀 Features
- ✨ **Clean & Responsive UI**: Smooth layout optimized for various screen sizes
- 🖼️ **Lazy Load Images**: Efficient image loading using cached_network_image
- 🔍 **Search**: by title or keyword
- 📜 **Pagination**: infinite scroll with lazy loading
- ❤️ **Favorites**: mark/unmark saved articles
- 💾 **Offline Storage**: Sqflite local database
- 🧠 **State Management**: using GetX
- 🌐 **API**: integrated with [NewsAPI.org](https://newsapi.org/)

---

## 🛠️ Technologies Used

- Flutter (Dart)
- GetX (state management & routing)
- Dio / GetConnect (HTTP client)
- Sqflite (local database)
- Cached Network Image (optimized image loading)
- NewsAPI.org (news source)

---

## 📦 Installation

### 1. 🔧 Prerequisites

- Flutter SDK installed — [Install Flutter](https://docs.flutter.dev/get-started/install)
- Android Studio or VS Code
- A NewsAPI.org API key — [Get API Key](https://newsapi.org/)

---

### 2. 📥 Clone the Repository

```bash
git clone https://github.com/dedypry/kanggo-mobile-test.git
cd kanggo-mobile-test
```
---
### 📁 Folder Structure
```bash
lib/
├── app/
│   ├── models/              # Data models (e.g., NewsModel)
│   ├── modules/
│   │   ├── home/            # Home page and controller
│   │   └── favorites/       # Favorites page and logic
│   ├── routes/              # App route definitions
│   └── controllers/         # Global controllers if any
├── configs/                 # API configs & SQLite DB initialization
apk/
└── mobile-test-kanggo.apk               # Built release APK

```

---

## 🛠 How to Run the App

### 1. 📦 Install Flutter & Dependencies

Make sure Flutter is installed:  
[Flutter Installation Guide](https://docs.flutter.dev/get-started/install)

```bash
flutter pub get
```

### 2. 🧪 Run the App on Device/Emulator
```bash
flutter run
```

### Or Download and Install apk in folder

```bash
apk/
└── mobile-test-kanggo.apk  
```