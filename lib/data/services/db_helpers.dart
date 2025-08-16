import "package:cloud_firestore/cloud_firestore.dart";

class DBHelpers {
  /// Clears chosen collections in the firebase DB
  static Future<void> clearCollections(List<String> collections) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    for (final String collection in collections) {
      // Get all docs
      final QuerySnapshot snapshot = await firestore
          .collection(collection)
          .get();
      // Delete docs
      for (final QueryDocumentSnapshot doc in snapshot.docs) {
        await doc.reference.delete();
      }
    }
  }
}
