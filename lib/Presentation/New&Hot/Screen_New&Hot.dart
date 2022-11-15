import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_demo/Application/New&Hot/newandhot_bloc.dart';
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
          body: const TabBarView(
            children: [
              ComingSoonLIst(key: Key('coming soon')),
              EveryoneWatchingList(
                key: Key('everyone_watching'),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Widget _comingsoonwidget({
  //   required BuildContext context,
  // }) {
  //   final screenwidth = MediaQuery.of(context).size.width;
  //   return ListView.builder(
  //     itemCount: 10,
  //     itemBuilder: (context, index) => ComingSoonWidget(),
  //   );
  // }

}

class ImageWithMuteIcon2 extends StatelessWidget {
  final String posterpath;
  const ImageWithMuteIcon2({
    Key? key,
    required this.posterpath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image(
            image: NetworkImage(posterpath),
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

class ComingSoonLIst extends StatelessWidget {
  const ComingSoonLIst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<NewandhotBloc>(context).add(LoadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<NewandhotBloc>(context).add(LoadDataInComingSoon());
      },
      child: BlocBuilder<NewandhotBloc, NewandhotState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
                child: CircularProgressIndicator(
              strokeWidth: 2,
            ));
          } else if (state.hasError) {
            return const Center(
                child: Text('Error while loading comingsoon list'));
          } else if (state.comingSoonList.isEmpty) {
            return const Center(child: Text('comingsoon list is empty'));
          } else {}
          return ListView.builder(
              itemCount: state.comingSoonList.length,
              itemBuilder: (context, index) {
                final movie = state.comingSoonList[index];
                if (movie.id == null) {
                  return SizedBox();
                }
                final _date = DateTime.parse(movie.releaseDate!);

                final formatedDate = DateFormat.yMMMd('en_US').format(_date);

                return ComingSoonWidget(
                  id: movie.id.toString(),
                  month: formatedDate.split(' ').first.substring(0, 3),
                  day: movie.releaseDate!.split('-')[1],
                  posterPath: '$ImageAppendUrl${movie.posterPath}',
                  movieName: movie.originalTitle ?? 'No Title',
                  description: movie.overview ?? 'No Overview',
                );
              });
        },
      ),
    );
  }
}

class EveryoneWatchingList extends StatelessWidget {
  const EveryoneWatchingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<NewandhotBloc>(context)
          .add(LoadDataInEveryOneIsWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<NewandhotBloc>(context)
            .add(LoadDataInEveryOneIsWatching());
      },
      child: BlocBuilder<NewandhotBloc, NewandhotState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
                child: CircularProgressIndicator(
              strokeWidth: 2,
            ));
          } else if (state.hasError) {
            return const Center(
                child: Text('Error while loading everyone watching list'));
          } else if (state.eveyOneWatchingList.isEmpty) {
            return const Center(
                child: Text(' everyone watching list is empty'));
          } else {}
          return ListView.builder(
              itemCount: state.eveyOneWatchingList.length,
              itemBuilder: (context, index) {
                final tv = state.eveyOneWatchingList[index];
                if (tv.id == null) {
                  return SizedBox();
                }

                return EveryonesWatching(
                  posterPath: '$ImageAppendUrl${tv.posterPath}',
                  SeriesName: tv.originalName ?? 'No name',
                  description: tv.overview ?? 'No Overview',
                );

                // ComingSoonWidget(
                //   id: movie.id.toString(),
                //   month: formatedDate.split(' ').first.substring(0, 3),
                //   day: movie.releaseDate!.split('-')[1],
                //   posterPath: '$ImageAppendUrl${movie.posterPath}',
                //   movieName: movie.originalTitle ?? 'No Title',
                //   description: movie.overview ?? 'No Overview',
                // );
              });
        },
      ),
    );
  }
}
