import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_demo/Core/Colors/Colors.dart';
import 'package:netflix_demo/Core/constans.dart';
import 'package:netflix_demo/Presentation/Home/widgets/costumsed_button.dart';
import 'package:netflix_demo/Presentation/New&Hot/widgets/coming_soon_widgets.dart';
import 'package:netflix_demo/Presentation/New&Hot/widgets/everyoncewatchingwidget.dart';
import 'package:netflix_demo/Presentation/New&Hot/widgets/image_with_muteicon.dart';

import '../main_widgets/appbar_widgets.dart';

class Screen_New_hot extends StatelessWidget {
  const Screen_New_hot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: AppBar(
                title: Text('New & Hot',
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                actions: [
                  Icon(
                    Icons.cast,
                    color: White,
                    size: 31,
                  ),
                  SizedBox(width: ScreenWidth * 0.03),
                  Container(
                    width: ScreenWidth * 0.08,
                    height: screenheight * 0.010,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png'),
                        ),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                        color: Blue),
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
                bottom: TabBar(
                    labelStyle: TextStyle(fontWeight: FontWeight.w500),
                    padding: EdgeInsets.all(10),
                    unselectedLabelColor: White,
                    labelColor: Black,
                    indicator: BoxDecoration(
                        color: White, borderRadius: BorderRadius.circular(30)),
                    tabs: [
                      Tab(
                        text: '🍿 Coming soon ',
                      ),
                      Tab(
                        text: "👀 Everyone's Watching",
                      )
                    ]),
              )),
          body: TabBarView(
            children: [
              _comingsoonwidget(context: context),
              _everyoneswatchingwidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget _comingsoonwidget({
    required BuildContext context,
  }) {
    final screenwidth = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => ComingSoonWidget(),
    );
  }

  Widget _everyoneswatchingwidget() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => EveryonesWatching(),
    );
  }
}

class ImageWithMuteIcon2 extends StatelessWidget {
  const ImageWithMuteIcon2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image(
            image: NetworkImage(
                'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/gFZriCkpJYsApPZEF3jhxL4yLzG.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 145, left: 320),
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
