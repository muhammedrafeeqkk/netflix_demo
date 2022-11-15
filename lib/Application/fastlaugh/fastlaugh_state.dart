part of 'fastlaugh_bloc.dart';

@freezed
class FastlaughState with _$FastlaughState {
  const factory FastlaughState(
      {required List<Downloads> videoslist,
      required bool isLoading,
      required bool isErorr}) = _Initial;

  factory FastlaughState.initial() => const FastlaughState(
        videoslist: [],
        isLoading: true,
        isErorr: false,
      );
}
