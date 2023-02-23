import 'package:flutter/material.dart';

class RowBuilder extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  const RowBuilder({super.key, required this.itemCount, required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(itemCount,
              (index) => itemBuilder(context, index)).toList(),
    );
  }
}