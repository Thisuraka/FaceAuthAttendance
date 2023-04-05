import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:hive_flutter/hive_flutter.dart';
part '../adapters/Person.g.dart';

@HiveType(typeId: 0)
class Person extends HiveObject {
  @HiveField(0)
  List<Face> face = [];

  @HiveField(1)
  String image = "";

  @HiveField(2)
  String name = "";

  Person(this.image, this.face, this.name);
}
