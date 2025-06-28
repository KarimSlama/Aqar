# 3qar

🏠 Real Estate App
A mobile application built for real estate management that serves three types of users: Buyers, Sellers, and Admins. The app allows property owners to list their assets, buyers to explore and purchase real estate, and admins to manage the overall system and moderate activity. Fast, scalable, and user-friendly, this is your go-to real estate companion.

## 📱 Features
👤 Multiple User Roles
Support for Sellers, Buyers, and Admins with role-based access.

🏡 Property Listings
Sellers can add, edit, and manage their properties with photos, prices, and details.

🔍 Smart Search & Filters
Buyers can browse properties by price, location, type, and more.

📩 In-App Chat (optional/coming soon)
Direct chat between buyers and sellers to negotiate or ask questions.

📊 Admin Panel
Admins can manage users, block listings, and ensure the smooth operation of the platform.

## 🛠️ Tech Stack
Flutter – Cross-platform mobile development

Dart – Core language for Flutter

Supabase – Backend and Authentication

Bloc for State management

Google Maps API – Property location & maps

## 🚀 Getting Started
Clone the repo

> git clone https://github.com/KarimSlama/aqar.git<br>
cd 3qar

-- Install dependencies
> flutter pub get

-- Run the app
> flutter run --release -t lib/main_production.dart --flavor production

## 🎨 UI Preview
You can check out the UI design on Figma or Behance:

## 📂 Project Structure

lib/<br>
│<br>
├── features/<br>
│   ├── auth/             # Login / Register<br>
│   ├── buyer/            # Buyer-specific screens<br>
│   ├── seller/           # Seller screens and listing management<br>
│   ├── admin/            # Admin dashboard<br>
│
├── models/               # Data models<br>
├── services/             # API or Firebase services<br>
├── shared/               # Reusable widgets, constants<br>
└── main.dart<br>
└── aqar_app.dart
