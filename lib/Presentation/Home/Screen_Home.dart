import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_demo/Application/home/home_bloc.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(GetHomeScreenData());
    });
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
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.hasError) {
                    return const Center(
                        child: Text(
                      'Error While Getting Data',
                      style: TextStyle(color: White),
                    ));
                  }
                  //release Past year
                  final _releasepastYear = state.pastYearMovieList.map((m) {
                    return '$ImageAppendUrl${m.posterPath}';
                  }).toList();

                  _releasepastYear.shuffle();

                  //tens drama
                  final _drama = state.tenseDramasMovieList.map((m) {
                    return '$ImageAppendUrl${m.posterPath}';
                  }).toList();
                  _drama.shuffle();

                  //south indian
                  final _southIndian = state.trendingMovieList.map((m) {
                    return '$ImageAppendUrl${m.posterPath}';
                  }).toList();
                  _southIndian.shuffle();

                  //trending
                  final _trending = state.trendingMovieList.map((m) {
                    return '$ImageAppendUrl${m.posterPath}';
                  }).toList();
                  _trending.shuffle();

                  //top10 Tv
                  final _top10 = state.trendingTVList.map((t) {
                    return '$ImageAppendUrl${t.posterPath}';
                  }).toList();

                  return ListView(
                    children: [
                      Home_Background(
                          screenheight: screenheight,
                          backgroundimag:
                              '$ImageAppendUrl${state.pastYearMovieList[2].posterPath}'),
                      homeMainCard(
                          description: 'Released in the past year',
                          posterList: _releasepastYear),
                      homeMainCard(
                          description: 'Trending Now', posterList: _trending),
                      NmberHomecard(posterpathlist: _top10.sublist(10)),
                      homeMainCard(
                          description: 'Tens Dramas', posterList: _drama),
                      homeMainCard(
                        description: 'South Indian Cenima',
                        posterList: _southIndian,
                      )
                    ],
                  );
                },
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
