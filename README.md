# SwiftUI Gallery Project

A simple SwiftUI gallery app that displays images in a grid using `ScrollView` and `LazyVGrid`. It uses `NavigationView` to navigate to a fullscreen image view. Images are downloaded and cached using **Kingfisher**. Networking is handled via `URLSession` with a clean MVVM architecture.

---

## Features

- Display images in a grid layout with `LazyVGrid`.
- Scrollable vertical gallery with `ScrollView`.
- Tap an image to view it fullscreen via `NavigationView` and `NavigationLink`.
- Download and cache images efficiently with **Kingfisher**.
- Fetch image URLs from API using `URLSession`.
- **Pagination**: Automatically load more images when reaching the end of the list.
- MVVM architecture for separation of concerns and easy maintenance.

---

## Requirements

- iOS 14+
- Swift 5+
- SwiftUI
- [Kingfisher](https://github.com/onevcat/Kingfisher) (Add via Swift Package Manager)

---

## Usage

- The app loads images from a remote API using `URLSession` in the ViewModel.
- Images are displayed in a 2-column grid inside a `ScrollView`.
- Tap any image to open it fullscreen.
- Kingfisher caches images automatically to improve performance and reduce network usage.

---

## Architecture

- **Model:** Represents image data.
- **ViewModel:** Handles API requests, pagination, and image list management.
- **View:** SwiftUI views displaying grid and fullscreen images.

---
## Screenshots

![WhatsApp Image 2025-05-17 at 04 22 57](https://github.com/user-attachments/assets/e81c58f5-f812-4d17-91ff-a350827c4057)


