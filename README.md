# 📝 Notes Watch App

A lightweight and intuitive **Apple Watch app** for quickly writing, saving, and managing notes — right on your wrist.

## ✨ Features

* Add, view, and delete notes directly from your Apple Watch.
* Notes are stored locally on the device using `JSONEncoder`/`JSONDecoder`.
* Clean and minimal design, optimized for **watchOS**.
* Persistent storage so your notes are available even after closing the app.
* Simple navigation with `NavigationStack` and `NavigationLink`.

## 📸 Screenshot

![Notes Watch App Screenshot](Simulator%20Screenshot%20-%20Apple%20Watch%20Series%2010%20\(46mm\)%20-%202025-09-08%20at%2005.57.51.png)

## 🛠 Tech Stack

* **SwiftUI** – modern declarative UI for watchOS.
* **watchOS SDK** – Apple Watch app framework.
* **Storage** – persistent local storage for notes.

## 🚀 Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/NotesWatchApp.git
   cd NotesWatchApp
   ```

2. Open in Xcode:

   ```bash
   open NotesWatchApp.xcodeproj
   ```

3. Run on an Apple Watch Simulator or a real device.

## 📂 Project Structure

```
NotesWatchApp/
│
├── Models/
│   └── Note.swift       # Note model (Identifiable, Codable)
│
├── Views/
│   ├── ContentView.swift # Main notes list
│   └── DetailView.swift  # Single note detail view
│   └── CreditsView.swift  # Simple View with Image View
│   └── SettingsView.swift  # Configure the line not number showing in the list view
│
└── Assets.xcassets       # App icons & assets
```

## 📱 Demo Flow

1. Tap ➕ to add a new note.
2. View your notes in a list with colored highlights.
3. Swipe left to delete.
4. Tap a note to view details.
