import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_demo/Core/Colors/Colors.dart';
import 'package:netflix_demo/Presentation/Home/widgets/costumsed_button.dart';

class Home_Background extends StatelessWidget {
  final String backgroundimag;
  const Home_Background({
    Key? key,
    required this.screenheight, required this.backgroundimag,
  }) : super(key: key);

  final double screenheight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: screenheight * 0.75,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                     backgroundimag),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon_text(icon: Icons.add, label: 'My List', color: White),
                PlayButton(),
                Icon_text(icon: Icons.info_outline, label: 'Info', color: White)
              ],
            ),
          ),
        )
      ],
    );
  }
}
