import 'package:auth_bloc/configs/assets.dart';
import 'package:auth_bloc/configs/locator.dart';
import 'package:auth_bloc/utils/app_orientation.dart';
import 'package:auth_bloc/utils/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final orientationNotifier = getIt.get<OrientationNotifier>();
  Orientation _orientation = getIt.get<OrientationNotifier>().orientation;

  @override
  void initState() {
    super.initState();
    orientationNotifier.addListener(() {
      setState(() {
        _orientation = orientationNotifier.orientation;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _orientation == Orientation.portrait ? _portraitBuild() : _landscapeBuild(),
    );
  }

  //widget functions
  Widget _portraitBuild() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(image: AppIcons.logo, height: 100),
        const SizedBox(height: 20),
        Text('Portrait Orientation', style: header2Text()),
      ],
    );
  }

  Widget _landscapeBuild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(image: AppIcons.logo, height: 100),
        const SizedBox(width: 20),
        Text('Landscape Orientation', style: header2Text()),
      ],
    );
  }
}