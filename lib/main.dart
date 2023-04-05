import 'package:camera/camera.dart';
import 'package:faceauth/models/Person.dart';
import 'package:faceauth/utils/hive.dart';
import 'package:flutter/material.dart';
import 'package:faceauth/views/onBoarding/splashScreen.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _cameras = await availableCameras();
  final firstCamera = _cameras.first;

  await Hive.initFlutter();
  await HiveBoxes.initialize();

  runApp(MyApp(firstCamera: firstCamera));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.firstCamera, Key? key}) : super(key: key);
  final firstCamera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(firstCamera: firstCamera),
    );
  }
}
