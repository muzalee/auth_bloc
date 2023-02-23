import 'package:flutter/material.dart';

const String _iconPath = 'assets/icons';

class _Icon extends AssetImage {
  const _Icon(String fileName) : super('$_iconPath/$fileName');
}

class AppIcons {
  static const logo = _Icon('ic_logo.png');
  static const user = _Icon('ic_user.png');

  static Future precacheAssets(BuildContext context) async {
    await precacheImage(logo, context);
  }
}