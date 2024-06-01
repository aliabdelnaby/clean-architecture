# Flutter Clean Architecture App with Dio

This repository contains a Flutter application that follows the Clean Architecture pattern and handles API requests using the Dio package.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Architecture](#architecture)

## Introduction

This project is a Flutter application designed to demonstrate the implementation of Clean Architecture principles. It uses Dio for making HTTP requests and managing API interactions efficiently.

## Features

- Clean Architecture
- Dio for API handling
- Separation of concerns
- Testable code

## Architecture

The project is organized into several layers:

- **Core Layer**: Contains core utilities and services such as connection, database, error handling, and parameters.
- **Feature Layer**: Contains feature-specific code such as data models, domain entities, and presentation logic.

### Directory Structure

```plaintext
lib/
├── core/
│   ├── connection/
│   ├── database/
│   ├── errors/
│   └── params/
├── features/
│   └── user/
│       ├── data/
│       ├── domain/
│       └── presentation/
│           ├── cubit/
│           ├── screens/
│           └── widgets/
└── main.dart
```
![9238e663-122f-4a9d-903d-ae45b33400f6](https://github.com/aliabdelnaby/clean-architecture/assets/70640625/3ab35291-42a7-4f7d-8ae9-cf8300b1c882)
