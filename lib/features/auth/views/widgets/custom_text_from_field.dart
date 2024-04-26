// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:medical_expert_app/core/componants/colors.dart';

class CustomTextFromField extends StatefulWidget {
  const CustomTextFromField({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    this.onChanged,
    this.keyboardType = TextInputType.emailAddress,
    this.color = kPrimary,
    this.controller,
    this.validator,
  }) : super(key: key);
  final String labelText;
  final Widget prefixIcon;
  final Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Color color;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFromField> createState() => _CustomTextFromFieldState();
}

class _CustomTextFromFieldState extends State<CustomTextFromField> {
  @override
  Widget build(BuildContext context) {
    Color errorColor = kSecondary3;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        controller: widget.controller,
        textAlignVertical: TextAlignVertical.center,
        onChanged: widget.onChanged,
        validator: widget.validator ??
            (value) {
              if (value!.isEmpty) {
                setState(() {
                  errorColor = widget.color;
                });

                return 'field is required';
              }
              setState(() {
                errorColor = kSecondary3;
              });
              return null;
            },
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          isDense: true,
          isCollapsed: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kSecondary2),
            borderRadius: BorderRadius.circular(35),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.color),
            borderRadius: BorderRadius.circular(35),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: const BorderSide(color: Colors.red),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          prefixIconColor: errorColor,
          prefixIcon: widget.prefixIcon,
          hintText: widget.labelText,
          hintStyle: const TextStyle(color: kSecondary3),
          // hintStyle: TextStyle(color: Colors.blue),
          filled: true,
          fillColor: kSecondary,
        ),
      ),
    );
  }
}
