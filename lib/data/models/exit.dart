/*
Exit
properties:
  id: String
  petId: String
  timestamp: DateTime
*/

class Exit {
  Exit({required this.id, required this.petId, required this.timestamp});
  final String id;
  final String petId;
  final DateTime timestamp;
}
