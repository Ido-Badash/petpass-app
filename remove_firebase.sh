#!/bin/bash
# remove_firebase.sh
# makes sure to run `chmod +x remove_firebase.sh` first
# Usage: run in your Flutter project root

echo "🚀 Removing Firebase from Flutter project..."

# Step 1: Remove Firebase config files
echo "🗑 Deleting Firebase config files..."
rm -f android/app/google-services.json
rm -f ios/Runner/GoogleService-Info.plist
rm -f lib/firebase_options.dart

# Step 2: Remove Firebase dependencies from pubspec.yaml
echo "✂ Removing Firebase dependencies from pubspec.yaml..."
if [ -f pubspec.yaml ]; then
  sed -i.bak '/firebase_/d' pubspec.yaml
  echo "✅ Firebase dependencies removed (backup saved as pubspec.yaml.bak)"
else
  echo "⚠ pubspec.yaml not found"
fi

# Step 3: Remove Android Firebase setup
echo "🔧 Cleaning Android Gradle files..."
# Remove classpath from android/build.gradle
if [ -f android/build.gradle ]; then
  sed -i.bak '/com.google.gms:google-services/d' android/build.gradle
  echo "✅ Removed Google Services classpath from android/build.gradle (backup created)"
fi
# Remove plugin from android/app/build.gradle
if [ -f android/app/build.gradle ]; then
  sed -i.bak "/com.google.gms.google-services/d" android/app/build.gradle
  echo "✅ Removed apply plugin from android/app/build.gradle"
fi

# Step 4: Remove iOS Firebase setup (optional)
echo "🛠 Cleaning iOS Firebase setup..."
rm -f ios/Runner/GoogleService-Info.plist
echo "✅ Removed GoogleService-Info.plist from iOS"

# Step 5: Clean Flutter project
echo "🧹 Cleaning Flutter project..."
flutter clean
flutter pub get

echo "🎉 Firebase removed successfully!"
