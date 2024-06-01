# Flutter Clean Architecture App with Dio

This repository contains a Flutter application that follows the Clean Architecture pattern and handles API requests using the Dio package.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Architecture](#architecture)
- [Installation](#installation)

## Introduction

This project is a Flutter application designed to demonstrate the implementation of Clean Architecture principles. It uses Dio for making HTTP requests and managing API interactions efficiently.

## Features

- Clean Architecture
- Dio for API handling
- Separation of concerns
- Testable code

## Architecture

The project is organized into several layers:

- **Core Layer**: Contains core utilities and services such as connection, database, API handling, caching, error handling, and parameters.
- **Feature Layer**: Contains feature-specific code such as data models, domain entities, and presentation logic.

### Directory Structure

```plaintext
lib/
├── core/
│   ├── connection/
│   ├── database/
│   │   ├── api/
│   │   └── cache/
│   ├── errors/
│   └── params/
├── features/
│   └── user/
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/
│           ├── cubit/
│           ├── screens/
│           └── widgets/
└── main.dart
```
## Installation
1. Clone the repository:

```bash
git clone https://github.com/aliabdelnaby/flutter-clean-architecture
cd flutter-clean-architecture-app
```
    
2. Install dependencies:

```bash
flutter pub get
```

3. Run the application:
```bash
flutter run
```

![9238e663-122f-4a9d-903d-ae45b33400f6](https://github.com/aliabdelnaby/clean-architecture/assets/70640625/3ab35291-42a7-4f7d-8ae9-cf8300b1c882)
