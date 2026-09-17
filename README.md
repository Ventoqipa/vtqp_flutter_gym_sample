# VTQP Technical Lab - Flutter Gym Sample

A lightweight Flutter application built for the VTQP Bootcamp Challenge 01. It displays gym membership details and access history using Clean Architecture, Riverpod for state management, and GoRouter for navigation.

## 🏛️ Architecture & Principles

This project follows **Clean Architecture** principles to separate concerns into explicit layers (`Presentation -> Domain <- Data`):

* **Domain Layer:** Contains core business logic, entities (`Membership`, `AccessRecord`), repository contracts, and use cases. It has zero dependencies on Flutter or data sources.
* **Data Layer:** Implements domain contracts using mock data repositories (`MockMembershipRepository`, `MockAccessHistoryRepository`)[cite: 1].
* **Presentation Layer:** Contains UI pages (`MembershipPage`, `AccessHistoryPage`), GoRouter configuration, and Riverpod controllers/providers to consume use cases[cite: 1].

## 🚀 How to Run the Application

### Prerequisites
* Flutter SDK (Latest Stable)
* Dart SDK

### Steps

1. **Install dependencies:**
   ```bash
   flutter pub get

2. **Run static analysis & tests:**

**Bash**

flutter analyze
flutter test


3. **Launch the application:**

**Bash**

flutter run


## 🧪 Testing

Unit tests cover the core Domain logic (Use Cases) using mock repositories to ensure independence from external frameworks. Execute all tests with:

**Bash**

flutter test


## 📋 Features Implemented

- Simulating user authentication / flow.
- Gym membership overview (status, tier, expiration date) fetched via domain contracts.
- Recent access history list fetched via domain contracts.
