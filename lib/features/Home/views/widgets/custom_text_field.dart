// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:medical_expert_app/core/componants/colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.labelText,
    this.keyboardType = TextInputType.number,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String labelText, title, subtitle;
  final TextInputType? keyboardType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      setState(() {});

                      return 'field is required';
                    }
                    setState(() {});
                    return null;
                  },
                  keyboardType: widget.keyboardType,
                  decoration: InputDecoration(
                    isDense: true,
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
                    hintText: widget.labelText,
                    filled: true,
                    prefixIcon: const SizedBox(),
                    fillColor: kSecondary,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                widget.subtitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
