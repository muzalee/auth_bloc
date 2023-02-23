import 'package:flutter/material.dart';

import '../const/color_const.dart';
import 'text.dart';

InputDecoration borderedTextField({String? hint, Color? hintColor, Color? fillColor, Color? borderColor, Widget? prefixIcon, Widget? suffixIcon, bool hideError = false}) {
  return InputDecoration(
    hintText: hint,
    hintStyle: regularText(color: hintColor),
    filled: fillColor != null,
    fillColor: fillColor,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: borderColor ?? ColorConst.primary, width: 0.0),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: borderColor ?? ColorConst.primary, width: 0.0),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 0.0),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 0.0),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    errorStyle: hideError ? const TextStyle(height: 0) : null,
  );
}

InputDecoration bottomBorderedTextField({String? hint, Color? hintColor, Color? borderColor, Widget? prefixIcon, Widget? suffixIcon,
  String? labelText}) {
  return InputDecoration(
    hintText: hint,
    hintStyle: regularText(color: hintColor),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: borderColor ?? ColorConst.primary, width: 0.0),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: borderColor ?? ColorConst.primary, width: 0.0),
    ),
    errorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 0.0),
    ),
    focusedErrorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 0.0),
    ),
    labelText: labelText,
    labelStyle: regularText(color: hintColor),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
  );
}