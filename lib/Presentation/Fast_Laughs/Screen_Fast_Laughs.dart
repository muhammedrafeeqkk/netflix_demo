import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_demo/Presentation/Fast_Laughs/widgets/video_list_item.dart';

class Screen_fast_Laughs extends StatelessWidget {
  const Screen_fast_Laughs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
        scrollDirection: Axis.vertical,
        children: List.generate(10, ((index) {
          return Video_List_item_widget(
            index: index,
          );
        })),
      )),
    );
  }
}
