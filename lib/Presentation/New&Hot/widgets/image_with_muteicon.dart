import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_demo/Core/Colors/Colors.dart';

class ImageWithMuteIcon extends StatelessWidget {
  const ImageWithMuteIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 185,
          child: Image(
            image: NetworkImage(
                'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/1V9IdXG5e9GF8kic6uVHGpTyJxa.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 135, left: 285),
          child: CircleAvatar(
            backgroundColor: Black.withOpacity(0.55),
            radius: 18,
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.volume_off,
                  size: 23,
                )),
          ),
        ),
      ],
    );
  }
}
