git clone https://github.com/Ido-Badash/petpass-app.git
ai-api/ – Install Python dependencies.
door-sensor/ – Upload firmware to microcontroller.
flutter-app/ – Install Flutter dependencies.
# 🐾 PetPass

PetPass is an **AI-powered smart pet door** 🚪 that recognizes your cats 🐱 and dogs 🐶, allowing only registered pets to enter or exit.  
It keeps your pets safe, your home secure 🏡, and unwanted animals out 🚫.

---

## ✨ Features

- 🔍 **AI Pet Recognition** – Uses machine learning to identify your pets
- 📡 **Motion Sensor** – Detects pet movement near the door
- 📱 **Mobile App Control** – Manage access from anywhere
- 🔔 **Real-Time Alerts** – Notifications when your pet comes or goes
- 🚫 **Intruder Protection** – Blocks unknown animals

---

## 📂 Project Structure

The system is split into three main parts:

1. **AI API** – Runs pet recognition and handles the access logic
2. **Door & Motion Sensor** – Hardware with sensors and motor control
3. **Flutter App** – Mobile app to control and monitor the door

---

## 🚀 Getting Started

### 1️⃣ Clone the Repository

```sh
git clone https://github.com/Ido-Badash/petpass-app.git
```

### 2️⃣ Install Dependencies

Follow the setup guide for each module:

- **ai-api/** – Install Python dependencies:
	```sh
	cd ai-api
	pip install -r requirements.txt
	```
- **door-sensor/** – Upload firmware to microcontroller (see firmware/README.md for instructions)
- **flutter-app/** – Install Flutter dependencies:
	```sh
	cd flutter-app
	flutter pub get
	```

### 3️⃣ Run the Project

- **AI API**
	```sh
	cd ai-api
	python main.py
	```
- **Door Sensor**
	- Flash firmware to the microcontroller
- **Flutter App**
	```sh
	cd flutter-app
	flutter run
	```

---

## 🛠 Tech Stack

- **AI API:** FILL HERE / FILL HERE
- **Door & Sensors:** FILL HERE / FILL HERE
- **Mobile App:** Flutter, Dart
- **Database:** Firebase