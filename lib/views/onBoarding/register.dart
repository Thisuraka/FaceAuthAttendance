import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:faceauth/models/Person.dart';
import 'package:faceauth/utils/settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:faceauth/widgets/customButton.dart';
import 'package:faceauth/widgets/customTextbox.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final firstCamera;
  const RegisterScreen({required this.firstCamera, Key? key}) : super(key: key);

  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _name = TextEditingController();
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  bool isCameraPreview = true;
  late XFile imageTaken;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(
      widget.firstCamera,
      ResolutionPreset.max,
    );
    _initializeControllerFuture = _cameraController.initialize();
    _cameraController.setFlashMode(FlashMode.off);
    _name.text = "ggg";
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<dynamic> pictureTake() async {
    if (isCameraPreview) {
      if (_name.text == "") {
        const snackBar = SnackBar(
          content: Text('Enter name'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        try {
          await _initializeControllerFuture;
          imageTaken = await _cameraController.takePicture();
          setState(() {
            isCameraPreview = false;
          });
        } catch (e) {
          print(e);
        }
      }
    } else {
      setState(() {
        isCameraPreview = true;
      });
    }
  }

  registerPerson() async {
    final inputImage = InputImage.fromFilePath(imageTaken.path);
    final options = FaceDetectorOptions();
    final faceDetector = FaceDetector(options: options);

    final List<Face> faces = await faceDetector.processImage(inputImage);

    File file = File(imageTaken.path);
    Uint8List bytes = file.readAsBytesSync();
    String base64Image = base64Encode(bytes);

    // var person = Person(base64Image, faces[0], _name.text);
    // Settings.setPersonData(jsonEncode(person));

    faceDetector.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: WillPopScope(
            onWillPop: () async => false,
            child: ScaffoldMessenger(
              child: Container(
                  color: Colors.black87,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
                  child: Column(
                    children: [
                      isCameraPreview
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height / 1.7,
                              width: MediaQuery.of(context).size.width,
                              child: FutureBuilder<void>(
                                future: _initializeControllerFuture,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return CameraPreview(_cameraController);
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                },
                              ),
                            )
                          : SizedBox(
                              height: MediaQuery.of(context).size.height / 1.7,
                              width: MediaQuery.of(context).size.width,
                              child: Image.file(File(imageTaken.path),
                                  fit: BoxFit.fitWidth),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextBox(controller: _name, labelText: "enter name"),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                          labelText: isCameraPreview
                              ? "Take Picture"
                              : "Retake picture",
                          onPress: () async {
                            pictureTake();
                          },
                          active: true),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                          labelText: "Register",
                          onPress: () async {
                            registerPerson();
                          },
                          active: true)
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
