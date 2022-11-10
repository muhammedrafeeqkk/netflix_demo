import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_demo/Core/Colors/Colors.dart';

class AppBarWidgets extends StatelessWidget {
  const AppBarWidgets({
    Key? key,
    required this.title,
    required this.itIsHomePage,
  }) : super(key: key);
  final String title;
  final bool itIsHomePage;
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          itIsHomePage
              ? Text(
                  title,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                )
              : Image(height: 50, image: AssetImage('assets/netflixlogo.png')),
          Spacer(),
          Icon(
            Icons.cast,
            color: White,
            size: 31,
          ),
          SizedBox(width: screenwidth * 0.03),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png')),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
                color: Blue),
            width: screenwidth * 0.08,
            height: screenheight * 0.030,
          ),
          SizedBox(
            width: screenwidth * 0.03,
          )
        ],
      ),
    );
  }
}
