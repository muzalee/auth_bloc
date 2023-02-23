import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

TextStyle extraSmallText({Color? color, FontWeight? fontWeight, bool wrap = true}) {
  return TextStyle(
    fontSize: 9.sp,
    color: color,
    fontWeight: fontWeight,
    overflow: wrap ? null : TextOverflow.ellipsis,
  );
}

TextStyle smallText({Color? color, FontWeight? fontWeight, bool wrap = true}) {
  return TextStyle(
    fontSize: 11.sp,
    color: color,
    fontWeight: fontWeight,
    overflow: wrap ? null : TextOverflow.ellipsis,
  );
}

TextStyle regularText({Color? color, FontWeight? fontWeight, bool wrap = true}) {
  return TextStyle(
    fontSize: 13.sp,
    color: color,
    fontWeight: fontWeight,
    overflow: wrap ? null : TextOverflow.ellipsis,
  );
}

TextStyle mediumText({Color? color, bool wrap = true}) {
  return TextStyle(
    fontSize: 15.sp,
    color: color,
    overflow: wrap ? null : TextOverflow.ellipsis,
  );
}

TextStyle largeText({Color? color, bool wrap = true}) {
  return TextStyle(
    fontSize: 18.sp,
    color: color,
    overflow: wrap ? null : TextOverflow.ellipsis,
  );
}

TextStyle header1Text({Color? color, bool wrap = true}) {
  return TextStyle(
    fontSize: 18.sp,
    color: color,
    fontWeight: FontWeight.bold,
    overflow: wrap ? null : TextOverflow.ellipsis,
  );
}

TextStyle header2Text({Color? color, bool wrap = true}) {
  return TextStyle(
    fontSize: 15.sp,
    color: color,
    fontWeight: FontWeight.bold,
    overflow: wrap ? null : TextOverflow.ellipsis,
  );
}