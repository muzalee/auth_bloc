import 'package:flutter/material.dart';

import '../const/color_const.dart';

ButtonStyle mainButton({Color? color}) {
  return ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    minimumSize: const Size.fromHeight(50),
    backgroundColor: color ?? ColorConst.primary,
    elevation: 0,
  );
}

ButtonStyle iconSquareButton({Color? backgroundColor, Size? minimumSize}) {
  return TextButton.styleFrom(
    backgroundColor: backgroundColor ?? ColorConst.primary,
    minimumSize: minimumSize,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
  );
}