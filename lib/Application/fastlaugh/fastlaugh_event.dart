part of 'fastlaugh_bloc.dart';

@freezed
class FastlaughEvent with _$FastlaughEvent {
  const factory FastlaughEvent.initialze() = Initialze;
  const factory FastlaughEvent.likeVideo({
    required int id,
  }) = LikedVideo;
  const factory FastlaughEvent.unLikeVideo({
    required int id,
  }) = UnLikedVideo;
}
