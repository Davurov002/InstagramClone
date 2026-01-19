# 📸 Instagram Clone (UIKit + SnapKit)

An Instagram-style iOS application built using **Swift**, **UIKit**, and **SnapKit**.  
This project recreates the core UI and user experience of Instagram while using **fully programmatic Auto Layout** (no Storyboards).

---

## ✨ Overview

This app is a learning-focused Instagram clone that demonstrates:
- Modern UIKit development
- Clean, scalable layout using SnapKit
- Reusable UI components
- Instagram-like screens and interactions

The goal is to closely mirror Instagram’s UI while keeping the codebase clean and easy to understand.

---

## 🚀 Features

- 🏠 Home Feed with posts
- ❤️ Like & Comment UI
- 🔍 Explore screen with grid layout
- ➕ Create Post screen
- 👤 User Profile screen
- 📱 Fully programmatic UI (no Storyboards)
- 📐 Auto Layout using **SnapKit**
- 🌙 Light & Dark Mode support
- ♻️ Reusable cells and views

---

## 🛠 Tech Stack

| Technology | Description |
|-----------|-------------|
| Swift | Programming language |
| UIKit | UI framework |
| SnapKit | Auto Layout DSL |
| SPM | Dependency management |
| MVC / MVVM | Architecture |
| iOS 16+ | Minimum supported version |

---

## 📦 Dependencies

This project uses **SnapKit** via **Swift Package Manager**.

### SnapKit

---

## 🧱 SnapKit Usage Example

```swift
let profileImageView = UIImageView()

view.addSubview(profileImageView)

profileImageView.snp.makeConstraints { make in
    make.top.equalToSuperview().offset(16)
    make.leading.equalToSuperview().offset(16)
    make.width.height.equalTo(80)
}

