import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool readOnly;
  final bool obscureText;
  final Icon? icon;
  final TextEditingController controller;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Color? borderColor;
  final Color? hintColor;
  final Color? textColor;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;
  final Color errorColor;
  final double sizeBorderRadius;

  // Constructor mejorado
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.borderColor,
    this.hintColor,
    this.keyboardType,
    this.readOnly = false,
    this.icon,
    this.errorMessage,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.errorColor = Colors.red,
    this.textColor,
    this.minLines,
    this.maxLines = 1,
    this.maxLength,
    this.sizeBorderRadius = 12.0, 
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor ?? Theme.of(context).colorScheme.outline,
        width: 1.5,
      ),
      borderRadius: BorderRadius.circular(sizeBorderRadius),
    );

    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      style: TextStyle(color: textColor),

      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,

      autovalidateMode: autovalidateMode,

      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        
        filled: true,

        label: label != null ? Text(label!) : null,
        hintText: hint,
        hintStyle: TextStyle(color: hintColor),
        errorText: errorMessage,
        errorStyle: TextStyle(color: errorColor),

        // --- Icono ---
        prefixIcon: icon,

        // --- Bordes ---
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor, // Resaltar el borde al enfocar
            width: 2,
          ),
        ),
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: errorColor, width: 1.5),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: errorColor, width: 2),
        ),
      ),
    );
  }
}