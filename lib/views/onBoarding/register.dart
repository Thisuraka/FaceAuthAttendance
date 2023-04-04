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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  late CameraController _cameraController;

  @override
  void initState() {
    super.initState();

    _cameraController =
        CameraController(widget.firstCamera, ResolutionPreset.max);
    _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomButton(
                          labelText: "Login ",
                          active: true,
                          onPress: () {
                            loginRegisterCheck();
                          }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  loginRegisterCheck() {}
}
