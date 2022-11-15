part of 'newandhot_bloc.dart';

@freezed
class NewandhotEvent with _$NewandhotEvent {
  const factory NewandhotEvent.loadDataInComingSoon () = LoadDataInComingSoon ;
   const factory NewandhotEvent.loadDataInEveryOneIsWatching () = LoadDataInEveryOneIsWatching ;
}