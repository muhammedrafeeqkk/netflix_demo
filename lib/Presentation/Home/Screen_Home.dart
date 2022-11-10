import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_demo/Core/Colors/Colors.dart';
import 'package:netflix_demo/Core/constans.dart';

import 'package:netflix_demo/Presentation/Home/widgets/home_backgroundimage.dart';

import 'package:netflix_demo/Presentation/Home/widgets/widgets.dart';
import 'package:netflix_demo/Presentation/main_widgets/appbar_widgets.dart';

ValueNotifier<bool> scrollDirections = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: ValueListenableBuilder(
        valueListenable: scrollDirections,
        builder: (context, Index, _) =>
            NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            print(direction);
            if (direction == ScrollDirection.reverse) {
              scrollDirections.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollDirections.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(
                children: [
                  Home_Background(screenheight: screenheight),
                  const homeMainCard(description: 'Released in the past year'),
                  homeMainCard(description: 'Trending Now'),
                  NmberHomecard(),
                  homeMainCard(description: 'Tens Dramas'),
                  homeMainCard(description: 'South Indian Cenima')
                ],
              ),
              scrollDirections.value == true
                  ? AnimatedContainer(
                      duration: Duration(milliseconds: 1000),
                      child: Container(
                        width: double.infinity,
                        height: screenheight * 0.108,
                        color: Colors.black.withOpacity(0.1),
                        child: Column(children: [
                          AppBarWidgets(title: '', itIsHomePage: false),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'TV Shows',
                                  style: khomeScreenTitle,
                                ),
                                Text('Movies', style: khomeScreenTitle),
                                Row(
                                  children: [
                                    Text('Categories', style: khomeScreenTitle),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: White,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ]),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      )),
    );
  }
}
