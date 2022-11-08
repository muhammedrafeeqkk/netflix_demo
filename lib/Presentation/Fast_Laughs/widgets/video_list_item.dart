import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.volume_mute)),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
