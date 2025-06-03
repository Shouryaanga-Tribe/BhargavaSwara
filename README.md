
# BhargavaSwara

**A Flutter Application for Indian Classical Music Analysis & Synthesis**

BhargavaSwara is a cross-platform Flutter application integrated with a Flask-based backend for advanced Indian Classical Music analysis and synthesis. Designed for musicians, researchers, and enthusiasts, this app leverages the [BhargavaSwara Library](https://github.com/Shouryaanga-Tribe/BhargavaSwaraLibrary) to provide an intuitive interface for analyzing ragas, talas, tempos, traditions, ornaments, and full music compositions. The deployed version is accessible at [BhargavaSwara Flask Service](https://bhargava-swara-flask-service-765294418264.us-east1.run.app/).

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE) [![Languages](https://img.shields.io/github/languages/count/Shouryaanga-Tribe/BhargavaSwara)](https://github.com/Shouryaanga-Tribe/BhargavaSwara)

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Google Tools Used](#google-tools-used)
- [Repository Structure](#repository-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Deployed Backend](#deployed-backend)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)
- [Acknowledgments](#acknowledgments)

---

## Overview

BhargavaSwara combines a modern Flutter-based frontend with a powerful Flask backend deployed on Google Cloud Run, offering a seamless experience for Indian Classical Music analysis and synthesis. The app supports real-time audio analysis and music generation, bridging traditional Indian music with cutting-edge technology. The deployed backend at [https://bhargava-swara-flask-service-765294418264.us-east1.run.app/](https://bhargava-swara-flask-service-765294418264.us-east1.run.app/) provides API endpoints for music analysis, accessible via an API key.

---

## Features

### Music Analysis
- **Raga Recognition:** Identify and classify ragas from uploaded audio files.
- **Tala Recognition:** Detect rhythmic cycles (talas) in performances.
- **Tempo Detection:** Calculate the tempo of musical pieces.
- **Tradition Identification:** Differentiate between Hindustani and Carnatic music traditions.
- **Ornamentation Detection:** Recognize and categorize musical embellishments.
- **Full Music Analysis:** Comprehensive analysis of audio for all musical components.
- **Spectrogram Visualizations:** Display MFCC, Mel spectrograms, and signal graphs (available in the Flutter app).

### Music Synthesis
- **Instrument Imitation:** Replicate traditional Indian instrument sounds.
- **Tanpura Drone Generation:** Create harmonic tanpura drones for practice.
- **Tala Generation:** Generate rhythmic patterns for accompaniment.

### Backend Integration
- **Flask API:** The deployed backend processes audio uploads and returns detailed analysis results.
- **API Key Authentication:** Secure access to analysis endpoints via user-provided API keys.

---

## Technologies Used

- **Flutter:** Cross-platform UI framework for Android, iOS, and web.
- **Dart:** Language for app logic and UI development.
- **Flask:** Python-based backend framework for API services.
- **BhargavaSwara Library:** Core audio processing and analysis (C++ backend).
- **Google Cloud Run:** Serverless platform hosting the Flask backend.
- **CMake:** Build system for native components.
- **Swift:** Native iOS/macOS integration (optional).

---

## Google Tools Used

BhargavaSwara leverages Google tools to enhance development, testing, and deployment:

- **Google Colab:**  
  Used for prototyping and testing audio analysis algorithms. Colab facilitated experimentation with signal processing and machine learning models for raga and tala detection.

- **Project IDX:**  
  Google’s cloud-based IDE streamlined Flutter frontend development and integration with native C++ components. It supported collaborative coding and cross-platform testing.

- **Gemini APIs:**  
  Integrated for advanced music analysis, including raga, ornamentation, and tradition detection. These APIs enhance the backend’s ability to process complex musical structures.

- **TensorFlow:**  
  Used in Colab to train and optimize machine learning models for audio feature extraction (e.g., MFCCs, spectrograms). These models are integrated into the BhargavaSwara Library for efficient mobile performance.

- **Google Cloud Run:**  
  Hosts the Flask backend, providing scalable and secure API services for audio analysis at [https://bhargava-swara-flask-service-765294418264.us-east1.run.app/](https://bhargava-swara-flask-service-765294418264.us-east1.run.app/).

---

## Repository Structure

```
BhargavaSwara/
├── .idx/                      # Project IDX configuration
├── android/                   # Android-specific Flutter code
├── dartpad/                   # DartPad integration files
├── extension_discovery/       # Extension discovery configurations
├── flutter_build/             # Flutter build scripts
├── lib/                       # Flutter source code
│   ├── screens/              # UI screens for analysis and synthesis
│   ├── widgets/              # Reusable UI components
│   └── services/             # BhargavaSwara Library and Flask API integration
├── test/                      # Unit and integration tests
├── web/                       # Web-specific Flutter code
├── .gitignore                # Git ignore file
├── .metadata                 # Project metadata
├── analysis_options.yaml      # Dart analysis configuration
├── package_config.json        # Package configuration
├── package_config_subset/     # Subset of package configurations
├── pubspec.lock              # Dependency lock file
├── pubspec.yaml              # Flutter project dependencies
├── version                    # Version information
├── README.md                  # Project documentation
└── LICENSE                    # MIT License file
```

- **lib:** Core Flutter code for the frontend, including screens, widgets, and API services.
- **android/web:** Platform-specific code for Android and web deployments.
- **test:** Test suites for ensuring code reliability.
- **flutter_build:** Scripts for building the Flutter app.

---

## Installation

### Prerequisites
- **Flutter SDK:** Install from [flutter.dev](https://flutter.dev/docs/get-started/install).
- **Dart:** Included with Flutter.
- **BhargavaSwara Library:** Install and link from [BhargavaSwara Library repo](https://github.com/Shouryaanga-Tribe/BhargavaSwaraLibrary).
- **C++ Compiler:** Supports C++11 or later.
- **CMake:** For building native code.
- **Python:** For running the Flask backend locally (optional).
- **Google Cloud SDK:** For deploying to Cloud Run (optional).

### Setup Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Shouryaanga-Tribe/BhargavaSwara.git
   cd BhargavaSwara
   ```

2. **Install Flutter Dependencies**
   ```bash
   flutter pub get
   ```

3. **Build Native Components**
   ```bash
   cd native
   mkdir build && cd build
   cmake ..
   make
   ```

4. **Run the Flutter App**
   ```bash
   flutter run
   ```

5. **(Optional) Run the Flask Backend Locally**
   - Ensure Python and Flask are installed.
   - Navigate to the Flask backend directory (if separate) and run:
     ```bash
     python app.py
     ```

*Note: Check code comments for platform-specific setup instructions.*

---

## Usage

BhargavaSwara provides an interactive platform for music analysis and synthesis:

- **Analyzing Music:**  
  - Upload an audio file via the Flutter app or the web interface at [https://bhargava-swara-flask-service-765294418264.us-east1.run.app/](https://bhargava-swara-flask-service-765294418264.us-east1.run.app/).
  - Enter your API key to authenticate with the backend.
  - Select analysis options: Raga, Tala, Tempo, Tradition, Ornaments, or Full Music.
  - View results, including spectrograms, in the app or web interface.

- **Synthesizing Music:**  
  - Generate tanpura drones or instrument sounds in the Flutter app.
  - Create and customize tala patterns for practice.

Sample audio files are included in the `assets` directory for testing.

---

## Deployed Backend

The Flask backend is deployed on Google Cloud Run at [https://bhargava-swara-flask-service-765294418264.us-east1.run.app/](https://bhargava-swara-flask-service-765294418264.us-east1.run.app/). It provides API endpoints for:

- **Audio Upload:** Upload audio files for analysis.
- **Analysis Endpoints:** Raga, Tala, Tempo, Tradition, Ornaments, and Full Music analysis.
- **API Key Authentication:** Secure access to analysis features.

To use the backend:
1. Obtain an API key (contact the repository owner if not provided).
2. Upload an audio file via the web interface or send a POST request to the appropriate endpoint (e.g., `/analyze/raga`).
3. View results returned as JSON or displayed in the web interface.

For local development or custom deployment, refer to the Flask backend code (if available in a separate repository or directory).

---

## Contributing

We welcome contributions! To contribute:

1. **Fork the Repository**
   ```bash
   git clone https://github.com/Shouryaanga-Tribe/BhargavaSwara.git
   cd BhargavaSwara
   ```

2. **Create a Branch**
   ```bash
   git checkout -b feature/YourFeatureName
   ```

3. **Commit Changes**
   ```bash
   git commit -m "Describe your changes"
   ```

4. **Push to GitHub**
   ```bash
   git push origin feature/YourFeatureName
   ```

5. **Submit a Pull Request:** Provide a detailed description.

Adhere to coding standards, include tests, and ensure compatibility with the deployed backend.

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Contact

- **Email:** [kckdeepak29@gmail.com](mailto:kckdeepak29@gmail.com)  
- **GitHub Issues:** [BhargavaSwara Issues](https://github.com/Shouryaanga-Tribe/BhargavaSwara/issues)

---

## Acknowledgments

- The Indian Classical Music community for inspiration and feedback.
- BhargavaSwara Library team for their foundational audio processing work.
- Google Cloud and Project IDX teams for development and deployment tools.
- Contributors and testers for their valuable input.
