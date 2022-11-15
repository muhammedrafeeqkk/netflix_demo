import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_demo/Core/Colors/Colors.dart';

class ImageWithMuteIcon extends StatelessWidget {
  final String url;
  const ImageWithMuteIcon({
    Key? key, required this.url,
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
                url),
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
