/*
PetModel
properties:
  id: String
  name: String
  age: int
  type: PetType
  inside: bool
  lastSeen: DateTime
  entriesToday: List<Entry>
  exitsToday: List<Exit>
*/

import 'entry.dart';
import 'exit.dart';
import 'pet_type.dart';

class PetModel {
  PetModel({
    required this.id,
    required this.name,
    required this.age,
    required this.type,
    required this.inside,
    required this.lastSeen,
    required this.entriesToday,
    required this.exitsToday,
  });
  final String id;
  final String name;
  final int age;
  final PetType type;
  final bool inside;
  final DateTime lastSeen;
  final List<Entry> entriesToday;
  final List<Exit> exitsToday;
}
