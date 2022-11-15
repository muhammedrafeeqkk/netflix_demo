import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_demo/Application/fastlaugh/fastlaugh_bloc.dart';
import 'package:netflix_demo/Application/search/search_bloc.dart';
import 'package:netflix_demo/Presentation/Fast_Laughs/widgets/video_list_item.dart';

class Screen_fast_Laughs extends StatelessWidget {
  const Screen_fast_Laughs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastlaughBloc>(context).add(const Initialze());
    });
    return Scaffold(
      body: SafeArea(child: BlocBuilder<FastlaughBloc, FastlaughState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
                child: CircularProgressIndicator(
              strokeWidth: 2,
            ));
          } else if (state.isErorr) {
            return const Center(child: Text('Erorr While Getting Data'));
          } else if (state.videoslist.isEmpty) {
            return const Center(child: Text('Video List Empty'));
          } else {
            return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(
                state.videoslist.length,
                ((index) {
                  return VideoListItemInheritedWidget(
                      widget: Video_List_item_widget(
                        index: index,
                        key: Key(index.toString()),
                      ),
                      moviedata: state.videoslist[index]);
                }),
              ),
            );
          }
        },
      )),
    );
  }
}
