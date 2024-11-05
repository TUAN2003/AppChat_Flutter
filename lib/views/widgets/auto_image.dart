import 'package:flutter/material.dart';

class AutoImageByName extends StatelessWidget {
  final Color color;
  final String name;
  const AutoImageByName({super.key, required this.color, required this.name});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 125,
      backgroundColor: color,
      child: Text(
        name[0],
        style: TextStyle(fontSize: 75),
      ),
    );
  }
}
