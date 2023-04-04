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

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(
      widget.firstCamera,
      ResolutionPreset.max,
    );

    _initializeControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  registerPerson() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
              color: Colors.black87,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.7,
                    width: MediaQuery.of(context).size.width,
                    child: FutureBuilder<void>(
                      future: _initializeControllerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return CameraPreview(_cameraController);
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextBox(controller: _name, labelText: "enter name"),
                  const SizedBox(
                    height: 100,
                  ),
                  CustomButton(
                      labelText: "Register",
                      onPress: registerPerson(),
                      active: true)
                ],
              )),
        ),
      ),
    );
  }
}
