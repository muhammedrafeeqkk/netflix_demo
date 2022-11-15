import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_demo/Application/search/search_bloc.dart';
import 'package:netflix_demo/Core/Colors/Colors.dart';
import 'package:netflix_demo/Domain/core/debounce/debounce.dart';
import 'package:netflix_demo/Presentation/Search/widget/SearchIdleWideget.dart';
import 'package:netflix_demo/Presentation/Search/widget/Search_result.dart';

class Screen_Search extends StatelessWidget {
  Screen_Search({
    Key? key,
  }) : super(key: key);
  final debouncer = Debouncer(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoSearchTextField(
              backgroundColor: Grey.withOpacity(0.4),
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: Grey,
              ),
              onChanged: ((value) {
                debouncer.run(() {
                  BlocProvider.of<SearchBloc>(context)
                      .add(SearchMovie(movieQuery: value));
                });
              }),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Grey,
              ),
              style: TextStyle(color: White),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Expanded(child: SearchResult())
          Expanded(child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.searchResultList.isEmpty) {
                return SearchIdleWidget();
              } else {
                return SearchResult();
              }
            },
          ))
        ],
      )),
    );
  }
}
