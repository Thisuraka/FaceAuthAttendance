import 'package:camera/camera.dart';
import 'package:faceauth/views/onBoarding/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../styles.dart';

class SplashScreen extends StatefulWidget {
  final firstCamera;
  const SplashScreen({required this.firstCamera, Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkNavigation();
  }

  checkNavigation() async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => RegisterScreen(firstCamera: widget.firstCamera),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: const Alignment(0.0, 0.0),
                child: Container(
                  margin: const EdgeInsets.all(40),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'assets/images/splash.gif',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          RegisterScreen(firstCamera: widget.firstCamera),
                    ),
                  )
                },
                child: Text("Are you present?",
                    style: GoogleFonts.raleway(
                      textStyle: LogoText,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
