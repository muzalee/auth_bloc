import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widget/actions_widget.dart';
import 'widget/details_widget.dart';
import 'widget/top_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        TopWidget(),
        SizedBox(height: 20),
        DetailsWidget(),
        SizedBox(height: 20),
        ActionsWidget(),
      ],
    );
  }
}