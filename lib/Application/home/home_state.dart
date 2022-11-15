part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
   required String Stateid,
    required List<NewAndHotData> pastYearMovieList,
    required List<NewAndHotData> trendingMovieList,
    required List<NewAndHotData> tenseDramasMovieList,
    required List<NewAndHotData> southIndianMovieList,
    required List<NewAndHotData> trendingTVList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory HomeState.initial() => HomeState(
      pastYearMovieList: [],
      trendingMovieList: [],
      tenseDramasMovieList: [],
      southIndianMovieList: [],
      trendingTVList: [],
      isLoading: false,
      hasError: false,
      Stateid: '0');
}
