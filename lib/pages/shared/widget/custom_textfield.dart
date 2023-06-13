import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  // String? hinttext;
  final controller;
  final validatorf;
  final obscureText;
  int? maxline;
  int? maxlength;

  TextInputType? keyborad;

  CustomField(
      {super.key,
      this.maxline,
      //required this.hinttext,
      required this.controller,
      required this.validatorf,
      this.keyborad,
      this.maxlength,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        style: const TextStyle(color: Colors.black),

        //autovalidateMode: AutovalidateMode.always,
        maxLines: maxline == null ? 1 : 4,
        maxLength: maxlength,
        obscureText: obscureText,
        validator: validatorf,
        textAlign: TextAlign.start,
        controller: controller,
        keyboardType: keyborad,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          // hintText: hinttext,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          hintTextDirection: TextDirection.ltr,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(width: 1, color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(width: 1, color: Colors.black),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.black,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(width: 1, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
