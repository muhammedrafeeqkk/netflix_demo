import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_demo/Domain/core/failures/main_failure.dart';
import 'package:netflix_demo/Domain/new_and_hot/model/new_and_hot.dart';
import 'package:netflix_demo/Domain/new_and_hot/new_and_hot_service.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final NewAndHotService _homeservice;
  HomeBloc(this._homeservice) : super(HomeState.initial()) {
    //on event get homeSCreenData
    on<GetHomeScreenData>((event, emit) async {
      //send loadinfg to ui
      emit(state.copyWith(hasError: false, isLoading: true));

      //get data
      final _movieresult = await _homeservice.getNewAndHotMovieData();
      final _tvresult = await _homeservice.getNewAndHotTVData();

      //transform data

      final _state1 = _movieresult.fold((MainFailure failure) {
        return  HomeState(
          Stateid: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramasMovieList: [],
          southIndianMovieList: [],
          trendingTVList: [],
          isLoading: false,
          hasError: true,
        );
      }, (NewAndHot resp) {
        final Pastyear = resp.results;
        final Trending = resp.results;
        final drama = resp.results;
        final southindian = resp.results;
        Pastyear.shuffle();
        Trending.shuffle();
        drama.shuffle();
        southindian.shuffle();

        return HomeState(
          Stateid: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: Pastyear,
            trendingMovieList: Trending,
            tenseDramasMovieList: drama,
            southIndianMovieList: southindian,
            trendingTVList: state.trendingTVList,
            isLoading: false,
            hasError: false);
      });

      emit(_state1);

      final _state2 = _tvresult.fold((MainFailure failure) {
        return  HomeState(

          Stateid: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramasMovieList: [],
          southIndianMovieList: [],
          trendingTVList: [],
          isLoading: false,
          hasError: true,
        );
      }, (NewAndHot resp) {
        final top10list = resp.results;
        ///////////////optional shuffling tv data ///////////
        top10list.shuffle();
        ////////////////////////////////
        return HomeState(Stateid: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: state.pastYearMovieList,
          trendingMovieList: state.trendingMovieList,
          tenseDramasMovieList: state.tenseDramasMovieList,
          southIndianMovieList: state.southIndianMovieList,
          trendingTVList: top10list,
          isLoading: false,
          hasError: false,
        );
      });
      emit(_state2);

      //send to ui
    });
  }
}
