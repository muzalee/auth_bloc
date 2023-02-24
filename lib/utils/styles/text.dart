import 'package:flutter/material.dart';

TextStyle extraSmallText({Color? color, FontWeight? fontWeight, bool wrap = true}) {
  return TextStyle(
    fontSize: 9,
    color: color,
    fontWeight: fontWeight,
    overflow: wrap ? null : TextOverflow.ellipsis,
  );
}

TextStyle smallText({Color? color, FontWeight? fontWeight, bool wrap = true}) {
  return TextStyle(
    fontSize: 11,
    color: color,
    fontWeight: fontWeight,
    overflow: wrap ? null : TextOverflow.ellipsis,
  );
}

TextStyle regularText({Color? color, FontWeight? fontWeight, bool wrap = true}) {
  return TextStyle(
    fontSize: 14,
    color: color,
    fontWeight: fontWeight,
    overflow: wrap ? null : TextOverflow.ellipsis,
  );
}

TextStyle mediumText({Color? color, bool wrap = true}) {
  return TextStyle(
    fontSize: 17,
    color: color,
    overflow: wrap ? null : TextOverflow.ellipsis,
  );
}

TextStyle largeText({Color? color, bool wrap = true}) {
  return TextStyle(
    fontSize: 20,
    color: color,
    overflow: wrap ? null : TextOverflow.ellipsis,
  );
}

TextStyle header1Text({Color? color, bool wrap = true}) {
  return TextStyle(
    fontSize: 20,
    color: color,
    fontWeight: FontWeight.bold,
    overflow: wrap ? null : TextOverflow.ellipsis,
  );
}

TextStyle header2Text({Color? color, bool wrap = true}) {
  return TextStyle(
    fontSize: 17,
    color: color,
    fontWeight: FontWeight.bold,
    overflow: wrap ? null : TextOverflow.ellipsis,
  );
}