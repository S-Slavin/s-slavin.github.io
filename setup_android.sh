#!/bin/bash

# Install Android Studio dependencies
brew install --cask android-studio

# Install Android SDK
brew install android-sdk

# Set up environment variables
echo 'export ANDROID_HOME=$HOME/Library/Android/sdk' >> ~/.zshrc
echo 'export PATH=$PATH:$ANDROID_HOME/tools' >> ~/.zshrc
echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools' >> ~/.zshrc

# Install Kotlin
brew install kotlin

# Install Gradle
brew install gradle

# Create Android project structure
mkdir -p SmartContextCompanion/Android/app/src/main/java/com/smartcontextcompanion/android
mkdir -p SmartContextCompanion/Shared/src/commonMain/kotlin/com/smartcontextcompanion/shared

echo "Android development environment setup complete!"
echo "Please open Android Studio and complete the initial setup wizard."
echo "Then, open the SmartContextCompanion project in Android Studio." 