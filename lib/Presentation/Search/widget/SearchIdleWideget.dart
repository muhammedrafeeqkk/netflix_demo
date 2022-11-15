import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix_demo/Application/search/search_bloc.dart';
import 'package:netflix_demo/Core/Colors/Colors.dart';
import 'package:netflix_demo/Core/constans.dart';
import 'package:netflix_demo/Presentation/Search/widget/Search_Title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Searchtitle(title: 'Top Searches'),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.isError) {
                return const Center(child: Text('Erorr While Getting Data'));
              } else if (state.idlelist.isEmpty) {
                return const Center(child: Text('List is empty'));
              }
              return ListView.separated(
                  itemBuilder: (context, index) {
                    final movie = state.idlelist[index];
                    return TopSearchesTile(
                      title: movie.title ?? 'NO title provided',
                      imageurl: "$ImageAppendUrl${movie.backGroundPath}",
                      imageUrl2: "$ImageAppendUrl${movie.posterPath}",
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 15,
                      ),
                  itemCount: state.idlelist.length);
            },
          ),
        )
      ],
    );
  }
}

class TopSearchesTile extends StatelessWidget {
  final String title;
  final String imageurl;
  final String imageUrl2;
  const TopSearchesTile(
      {Key? key,
      required this.title,
      required this.imageurl,
      required this.imageUrl2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: 80,
          width: ScreenWidth * 0.4,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageurl), fit: BoxFit.cover)),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        )),
        Icon(
          Icons.play_circle_outline,
          color: White,
          size: 40,
        ),
        SizedBox(
          width: 15,
        )
      ],
    );
  }
}
