import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_demo/Core/Colors/Colors.dart';

class Video_List_item_widget extends StatelessWidget {
  final int index;
  const Video_List_item_widget({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //left  side
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: CircleAvatar(
                      backgroundColor: Black.withOpacity(0.35),
                      radius: 28,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.volume_off)),
                    ),
                  ),

                  //right side
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage(
                                'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/dQrNM5Vsr9CK8o6lmofav9Dueq9.jpg')),
                      ),
                      VideoActionWidget(
                          icon: Icons.emoji_emotions, title: 'LOL'),
                      VideoActionWidget(icon: Icons.add, title: 'My List'),
                      VideoActionWidget(icon: Icons.share, title: 'Share'),
                      VideoActionWidget(icon: Icons.play_arrow, title: 'Play')
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidget(
      {Key? key, required final this.icon, required final this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
            color: White,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          )
        ],
      ),
    );
  }
}
