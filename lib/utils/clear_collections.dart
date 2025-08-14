import "package:cloud_firestore/cloud_firestore.dart";

/// Clears chosen collections in the firebase DB
Future<void> clearCollections(List<String> collections) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  for (final String collection in collections) {
    // Get all documents in the current collection.
    final QuerySnapshot snapshot = await firestore.collection(collection).get();
    // Delete each document in the collection.
    for (final QueryDocumentSnapshot doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }
}
