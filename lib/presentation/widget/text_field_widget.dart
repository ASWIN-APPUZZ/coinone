import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? errorText;
  final IconData? trailingIcon;
  final VoidCallback? toggleObscureText;

  const TextFieldWidget({
    required this.controller,
    required this.labelText,
    required this.icon,
    this.obscureText = false,
    this.onChanged,
    this.errorText,
    this.trailingIcon,
    this.toggleObscureText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        suffixIcon: trailingIcon != null && toggleObscureText != null
            ? IconButton(
                icon: Icon(trailingIcon),
                onPressed: toggleObscureText,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        errorText: errorText,
      ),
      obscureText: obscureText,
    );
  }
}