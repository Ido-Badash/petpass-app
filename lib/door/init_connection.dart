import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petpass/door/check_status.dart';

/// Call this function to update the door's online/offline status in Firestore.
Future<void> initConnection() async {
  final isOnline = await DoorStatusChecker.checkDoorStatus();
  await FirebaseFirestore.instance.collection("door").add({
    "status": isOnline ? "online" : "offline",
    "timestamp": FieldValue.serverTimestamp(),
  });
}
