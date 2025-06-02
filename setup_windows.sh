#!/bin/bash

# Install .NET SDK
brew install --cask dotnet-sdk

# Install Visual Studio for Mac
brew install --cask visual-studio

# Create Windows project structure
mkdir -p SmartContextCompanion/Windows/SmartContextCompanion.Windows

echo "Windows development environment setup complete!"
echo "Please open Visual Studio and complete the initial setup wizard."
echo "Then, open the SmartContextCompanion.Windows project in Visual Studio." 