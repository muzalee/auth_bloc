import 'package:auth_bloc/utils/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ActionsWidget extends StatelessWidget {
  const ActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(CupertinoIcons.settings),
              const SizedBox(width: 5),
              Expanded(
                child: Text('Actions', style: regularText()),
              ),
            ],
          ),
          const Divider(),
          _action('Edit Profile', Icons.edit, (){}),
          _action('Change Password', Icons.lock_open, (){}),
          _action('Logout', Icons.logout, (){}),
        ],
      )
    );
  }

  //widget functions
  Widget _action(String label, IconData icon, Function()? onEvent) {
    return ListTile(
      title: Text(label, style: regularText()),
      trailing: Icon(icon, size: 18.sp),
    );
  }
}