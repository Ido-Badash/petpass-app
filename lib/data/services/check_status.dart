/*
Checks the status of the door
- if the the connection to the app is online
- other errors
*/

class DoorStatusChecker {
  static Future<bool> get status async =>
      !await checkForErrors() && await checkForConnection();

  static Future<bool> checkForErrors() async {
    return false; // No errors
  }

  static Future<bool> checkForConnection() async {
    return true; // Connection is online
  }
}
