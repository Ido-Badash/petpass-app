/*
Checks the status of the door
- if the the connection to the app is online
- other errors
*/

class DoorStatusChecker {
  static bool checkDoorStatus() {
    // Check for errors
    final bool haveErrors = checkForErrors();

    // Check if the door is online
    final bool isOnline = checkForConnection();

    return !haveErrors && isOnline;
  }

  static bool checkForErrors() {
    return false; // No errors
  }

  static bool checkForConnection() {
    return true; // Connection is online
  }
}
