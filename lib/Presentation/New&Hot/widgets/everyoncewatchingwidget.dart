import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix_demo/Core/Colors/Colors.dart';

import '../../Home/widgets/costumsed_button.dart';
import '../Screen_New&Hot.dart';

Widget EveryonesWatching(
    {required String posterPath,
    required String SeriesName,
    required String description}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageWithMuteIcon2(posterpath: posterPath),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                SeriesName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
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
          SeriesName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          description,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Grey),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    ),
  );
}
