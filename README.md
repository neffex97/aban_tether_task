# aban_tether_task

## Overview

The **UserDetails** feature module is a Flutter implementation using **clean architecture** and **Bloc(Cubit)** for state management. It allows users to view their details (name, email) and submit their phone number, validated with an Iranian phone number regex.

---

## Features

- Displays user details (name and email).
- Validates and submits phone numbers.
- Clean architecture with:
  - **Presentation Layer**: UI and BLoC.
  - **Domain Layer**: Business logic.
  - **Data Layer**: Remote data sources and repositories.
- **Dependency Injection** using GetIt.

---

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/neffex97/aban_tether_task.git
   cd user_details_module

    ```

2. Install dependencies:

    ```bash
    flutter pub get
    ```

3. Run the app:

    ```bash
    flutter run

    ```

## Folder Structure

```plaintext
lib/
├── core/
└── features/
    └── user_details/
        ├── data/                  # Data Layer: Models, Datasources, Repositories
        ├── domain/                # Domain Layer: Entities, Use Cases, Interfaces
        ├── presentation/          # Presentation Layer: UI and BLoC (Cubit)
        └── injection_container.dart # Dependency injection setup
```

## Technology Stack

- Flutter, Dart
- Cubit for state management
- GetIt for dependency injection
- Clean Architecture
