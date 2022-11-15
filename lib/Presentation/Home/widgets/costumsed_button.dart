import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_demo/Core/Colors/Colors.dart';

Column Icon_text(
    {required IconData icon, required String label, required Color color}) {
  return Column(
    children: [
      Icon(
        icon,
        color: White,
      ),
      Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold, color: color),
      )
    ],
  );
}

TextButton PlayButton() {
  return TextButton.icon(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(White)),
      onPressed: () {},
      icon: Icon(
        Icons.play_arrow,
        color: Black,
      ),
      label: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          'Play',
          style: TextStyle(fontWeight: FontWeight.bold, color: Black),
        ),
      ));
}
