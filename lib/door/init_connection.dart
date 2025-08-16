import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petpass/door/check_status.dart';

/// Check connection
Future<void> initConnection() async {
  await FirebaseFirestore.instance.collection("/door").add({
    "status": DoorStatusChecker.checkDoorStatus() ? "online" : "offline",
    "timestamp": FieldValue.serverTimestamp(),
  });
}
