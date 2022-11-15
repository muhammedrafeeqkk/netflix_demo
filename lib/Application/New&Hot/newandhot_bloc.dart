import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_demo/Domain/core/failures/main_failure.dart';
import 'package:netflix_demo/Domain/new_and_hot/model/new_and_hot.dart';
import 'package:netflix_demo/Domain/new_and_hot/new_and_hot_service.dart';

part 'newandhot_event.dart';
part 'newandhot_state.dart';
part 'newandhot_bloc.freezed.dart';

@injectable
class NewandhotBloc extends Bloc<NewandhotEvent, NewandhotState> {
  final NewAndHotService _newAndHotService;
  NewandhotBloc(this._newAndHotService) : super(NewandhotState.initial()) {
    //get New And Hot MOvie data
    on<LoadDataInComingSoon>((event, emit) async {
// Send loading ui
      emit(const NewandhotState(
          comingSoonList: [],
          eveyOneWatchingList: [],
          isLoading: true,
          hasError: false));
      //get data from remote
      final _result = await _newAndHotService.getNewAndHotMovieData();

      //data to state
      final newstate = _result.fold(
        (MainFailure failure) {
          return const NewandhotState(
            comingSoonList: [],
            eveyOneWatchingList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (NewAndHot resp) {
          return NewandhotState(
            comingSoonList: resp.results,
            eveyOneWatchingList: state.eveyOneWatchingList,
            isLoading: false,
            hasError: false,
          );
        },
      );
      
      emit(newstate);
  

    });

//get New And Hot TV data
    on<LoadDataInEveryOneIsWatching>((event, emit) async{

// Send loading ui
      emit(const NewandhotState(
          comingSoonList: [],
          eveyOneWatchingList: [],
          isLoading: true,
          hasError: false));
      //get data from remote
      final _result = await _newAndHotService.getNewAndHotTVData();

      //data to state
      final newstate = _result.fold(
        (MainFailure failure) {
          return const NewandhotState(
            comingSoonList: [],
            eveyOneWatchingList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (NewAndHot resp) {
          return NewandhotState(
            comingSoonList:state.comingSoonList,
            eveyOneWatchingList: resp.results,
            isLoading: false,
            hasError: false,
          );
        },
      );
   
      emit(newstate);
    


    });
  }
}
