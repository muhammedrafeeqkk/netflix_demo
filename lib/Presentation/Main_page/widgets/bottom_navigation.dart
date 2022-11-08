import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_demo/Core/Colors/Colors.dart';

ValueNotifier<int> IndexValueNotifier = ValueNotifier(0);

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: IndexValueNotifier,
      builder: (context, int newindex, child) {
        return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Black,
            currentIndex: newindex,
            onTap: (intex) {
              IndexValueNotifier.value = intex;
            },
            selectedItemColor: White,
            unselectedItemColor: Grey,
            selectedIconTheme: IconThemeData(color: White),
            unselectedIconTheme: IconThemeData(color: Grey),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.collections),
                label: 'New & Hot',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.face),
                label: 'Fast Laughs',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_circle_down_outlined),
                  label: 'Downloads'),
            ]);
      },
    );
  }
}
