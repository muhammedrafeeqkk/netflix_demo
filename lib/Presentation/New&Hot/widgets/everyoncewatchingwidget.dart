import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_demo/Core/Colors/Colors.dart';

import '../../Home/widgets/costumsed_button.dart';
import '../Screen_New&Hot.dart';

Widget EveryonesWatching() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageWithMuteIcon2(),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              'Money Heist',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon_text(icon: Icons.share, label: 'Share', color: Grey),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon_text(icon: Icons.add, label: 'My LIst', color: Grey),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child:
                  Icon_text(icon: Icons.play_arrow, label: 'Play', color: Grey),
            ),
          ],
        ),
        Row(
          children: [
            Image(
              image: AssetImage(
                'assets/netflixlogo.png',
              ),
              height: 15,
            ),
            Text(
              'SERIES',
              style: TextStyle(fontWeight: FontWeight.bold, color: Grey),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Money Heist',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Landing the lead in the school musical is a dream come true for jodi,until the pressure sends her confidence--and her relationship--into a tailspin.',
          style: TextStyle(color: Grey),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    ),
  );
}
