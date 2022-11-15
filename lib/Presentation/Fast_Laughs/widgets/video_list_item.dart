import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_demo/Application/fastlaugh/fastlaugh_bloc.dart';
import 'package:netflix_demo/Application/search/search_bloc.dart';
import 'package:netflix_demo/Core/Colors/Colors.dart';
import 'package:netflix_demo/Core/constans.dart';
import 'package:netflix_demo/Domain/downloads/models/downloads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads moviedata;

  const VideoListItemInheritedWidget(
      {Key? key, required this.widget, required this.moviedata})
      : super(key: key, child: widget);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.moviedata != moviedata;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class Video_List_item_widget extends StatelessWidget {
  final int index;
  const Video_List_item_widget({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.moviedata.posterPath;
    final videoUrl = DummyVIdeoUrl[index % DummyVIdeoUrl.length];
    return Stack(
      children: [
        FastLaughVideoPlayer(videourl: videoUrl, onStateChanged: (bool) {}),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //left  side
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: CircleAvatar(
                    backgroundColor: Black.withOpacity(0.35),
                    radius: 28,
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.volume_off)),
                  ),
                ),

                //right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CircleAvatar(
                          radius: 28,
                          backgroundImage: posterPath == null
                              ? null
                              : NetworkImage('$ImageAppendUrl$posterPath')),
                    ),
                    ValueListenableBuilder(
                      valueListenable: likedVideosIDNotifier,
                      builder: (BuildContext c, Set<int> newLinkedListIds,
                          Widget? _) {
                        final _index = index;
                        // ignore: iterable_contains_unrelated_type
                        if (newLinkedListIds.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              likedVideosIDNotifier.value.remove(_index);
                              likedVideosIDNotifier.notifyListeners();
                              // BlocProvider.of<FastlaughBloc>(context)
                              //     .add(UnLikedVideo(id: _index));
                            },
                            child: VideoActionWidget(
                                icon: Icons.favorite, title: 'Liked'),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            likedVideosIDNotifier.value.add(_index);
                            likedVideosIDNotifier.notifyListeners();
                          },
                          child: VideoActionWidget(
                              icon: Icons.emoji_emotions, title: 'LOL'),
                        );
                      },
                    ),
                    VideoActionWidget(icon: Icons.add, title: 'My List'),
                    GestureDetector(
                        onTap: () {
                          final Moviename =
                              VideoListItemInheritedWidget.of(context)!
                                  .moviedata
                                  .title;

                          if (Moviename != null) {
                            Share.share(Moviename);
                          }
                        },
                        child: VideoActionWidget(
                            icon: Icons.share, title: 'Share')),
                    VideoActionWidget(icon: Icons.play_arrow, title: 'Play')
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidget(
      {Key? key, required final this.icon, required final this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
            color: White,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          )
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videourl;
  final void Function(bool isPlaying) onStateChanged;
  const FastLaughVideoPlayer(
      {Key? key, required this.videourl, required this.onStateChanged})
      : super(key: key);

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videourl);
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(
              strokeWidth: 2,
            )),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
