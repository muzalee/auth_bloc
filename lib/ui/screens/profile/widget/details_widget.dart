import 'package:auth_bloc/utils/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key});

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
              const Icon(CupertinoIcons.doc_plaintext),
              const SizedBox(width: 5),
              Expanded(
                child: Text('Details', style: regularText()),
              ),
            ],
          ),
          const Divider(),
          _detail('Name', 'John'),
          _detail('Email', 'john@email.com'),
          _detail('Company Name', 'John Co.'),
          _detail('IC/Passport Number', '000000-00-0000'),
          _detail('Phone Number', '0123456789'),
        ],
      )
    );
  }

  //widget functions
  Widget _detail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(label, style: regularText()),
          const SizedBox(width: 8),
          Expanded(
            child: Text(value, style: regularText(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}