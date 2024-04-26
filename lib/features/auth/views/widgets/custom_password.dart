import 'package:flutter/material.dart';
import 'package:medical_expert_app/core/componants/colors.dart';

class CustomPassword extends StatefulWidget {
  const CustomPassword({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    this.onChanged,
    this.controller,
  }) : super(key: key);
  final String labelText;
  final Widget prefixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  @override
  State<CustomPassword> createState() => _CustomPasswordState();
}

class _CustomPasswordState extends State<CustomPassword> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        textAlignVertical: TextAlignVertical.center,
        validator: (value) {
          if (value!.isEmpty) {
            return '*The password you entered is wrong';
          }

          return null;
        },
        obscureText: obscureText,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(
                () {
                  obscureText = !obscureText;
                },
              );
            },
          ),
          isDense: true,
          isCollapsed: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kSecondary2),
            borderRadius: BorderRadius.circular(35),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimary),
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
          prefixIconColor: kSecondary3,
          prefixIcon: widget.prefixIcon,
          hintStyle: const TextStyle(color: kSecondary3),
          hintText: widget.labelText,
          filled: true,
          fillColor: kSecondary,
        ),
      ),
    );
  }
}
