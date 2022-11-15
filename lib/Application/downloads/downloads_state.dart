part of 'downloads_bloc.dart';

@freezed
class DownloadState with _$DownloadState {
  const factory DownloadState({
    required bool isloading,
    required Option<Either<MainFailure, List<Downloads>>>
        downloadFailureOrSuccessOption,
    required List<Downloads> downloads,
  }) = _DownloadState;

  factory DownloadState.Inital() {
    return DownloadState(
        isloading: false,
        downloadFailureOrSuccessOption: none(),
        downloads: [
          //////////////
          //outside changed
          Downloads(posterPath: '', title: '', backGroundPath: ''),
          Downloads(posterPath: '', title: '', backGroundPath: ''),
          Downloads(posterPath: '', title: '', backGroundPath: ''),
        ]);
  }
}
