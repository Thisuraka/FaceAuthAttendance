import 'package:hive_flutter/hive_flutter.dart';

import '../models/Person.dart';

class HiveBoxes {
  static const userDetails = "user_details";

  // static Box userDetailsBox() => Hive.box(userDetails);

  static initialize() async {
    Hive.registerAdapter(PersonAdapter());
    // await Hive.openBox(userDetails);
  }

  static clearAllBox() async {
    // await HiveBoxes.userDetailsBox().clear();
  }

  static addData(Person person) async {
    // await HiveBoxes.userDetailsBox().put(person.name, person);

    var userBox = await Hive.box<Person>(userDetails);
    userBox.put('user_details', person);

    // final persons = await HiveBoxes.userDetailsBox().get(person.name);
    print("-------------------------");
    // print(persons);
    print("-------------------------");
  }
}
