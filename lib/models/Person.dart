import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Person extends HiveObject {
  String image = "";

  Face face;

  String name = "";

  Person(this.image, this.face, this.name);
}
