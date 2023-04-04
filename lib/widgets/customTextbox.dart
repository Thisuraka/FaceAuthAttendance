import 'package:google_fonts/google_fonts.dart';

import '../../styles.dart';
import 'package:flutter/material.dart';

class CustomTextBox extends StatelessWidget {
  TextEditingController controller;
  TextCapitalization textCapitalization;
  TextInputType keyboardType;
  bool readOnly;
  bool enabled;
  int minLine;
  int maxLine;
  TextStyle hintStyle;
  String labelText;
  bool obscureText;
  String? Function(dynamic)? validator;

  CustomTextBox({
    required this.controller,
    required this.labelText,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.enabled = true,
    this.minLine = 1,
    this.maxLine = 1,
    this.hintStyle = HintStyle1,
    this.obscureText = false,
  });

  static InputBorder errorBorder =
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.red));

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.cabin(textStyle: LabelStyle1),
      maxLines: maxLine,
      minLines: minLine,
      keyboardType: keyboardType,
      autofocus: false,
      textCapitalization: textCapitalization,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      textAlign: TextAlign.center,
      readOnly: readOnly,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black12,
        labelText: labelText,
        labelStyle: GoogleFonts.cabin(textStyle: LabelStyle1),
        contentPadding: const EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 10.0),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(30.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(30.0),
        ),
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
        enabled: enabled,
      ),
    );
  }
}
