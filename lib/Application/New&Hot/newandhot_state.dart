part of 'newandhot_bloc.dart';

@freezed
class NewandhotState with _$NewandhotState {
  const factory NewandhotState({
   required  List<NewAndHotData>comingSoonList,
   required  List<NewAndHotData>eveyOneWatchingList,
   required bool isLoading,
   required bool hasError


  }) = _Initial;


  factory NewandhotState.initial()=>NewandhotState(comingSoonList: [], eveyOneWatchingList: [], hasError: false,isLoading: false);
}
