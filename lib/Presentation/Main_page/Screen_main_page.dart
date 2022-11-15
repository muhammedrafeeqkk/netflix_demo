import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_demo/Core/Colors/Colors.dart';
import 'package:netflix_demo/Presentation/Downloads/Screen_Download.dart';
import 'package:netflix_demo/Presentation/Fast_Laughs/Screen_Fast_Laughs.dart';
import 'package:netflix_demo/Presentation/Home/Screen_Home.dart';
import 'package:netflix_demo/Presentation/Main_page/widgets/bottom_navigation.dart';
import 'package:netflix_demo/Presentation/New&Hot/Screen_New&Hot.dart';
import 'package:netflix_demo/Presentation/Search/Screen_Search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);

  final _pages = [
    ScreenHome(),
    Screen_New_hot(),
    Screen_fast_Laughs(),
    Screen_Search(),
    Screen_Download()
  ];

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: IndexValueNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
