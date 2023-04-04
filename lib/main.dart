import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:faceauth/views/onBoarding/register.dart';
import 'package:faceauth/views/onBoarding/splashScreen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _cameras = await availableCameras();
  final firstCamera = _cameras.first;

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
