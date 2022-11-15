import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_demo/Domain/downloads/i_downloads_repo.dart';
import 'package:netflix_demo/Domain/downloads/models/downloads.dart';

part 'fastlaugh_event.dart';
part 'fastlaugh_state.dart';
part 'fastlaugh_bloc.freezed.dart';

final DummyVIdeoUrl = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
];

ValueNotifier<Set<int>> likedVideosIDNotifier = ValueNotifier({});

@injectable
class FastlaughBloc extends Bloc<FastlaughEvent, FastlaughState> {
  FastlaughBloc(
    IDownloadsRepo _downloadService,
  ) : super(FastlaughState.initial()) {
    on<Initialze>((event, emit) async {
      //sending loading to ui
      emit(FastlaughState(
        videoslist: [],
        isLoading: true,
        isErorr: false,
      ));
      // get trending movies
      final _result = await _downloadService.getDownloadsImages();
      final _state = _result.fold((l) {
        return FastlaughState(
          videoslist: [],
          isLoading: false,
          isErorr: true,
        );
      },
          (resp) => FastlaughState(
                videoslist: resp,
                isLoading: false,
                isErorr: false,
              ));
      //send to  ui

      emit(_state);
    });
    on<LikedVideo>((event, emit) async {
      likedVideosIDNotifier.value.add(event.id);
      likedVideosIDNotifier.notifyListeners();
    });
    on<UnLikedVideo>((event, emit) async {
      likedVideosIDNotifier.value.remove(event.id);
      likedVideosIDNotifier.notifyListeners();
      ;
    });
  }
}
