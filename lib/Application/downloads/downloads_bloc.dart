import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_demo/Domain/core/failures/main_failure.dart';
import 'package:netflix_demo/Domain/downloads/i_downloads_repo.dart';

import '../../Domain/downloads/models/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvents, DownloadState> {
  final IDownloadsRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadState.Inital()) {
    on<_GetDownloadsImages>((event, emit) async {
      emit(
        state.copyWith(isloading: true, downloadFailureOrSuccessOption: none()),
      );
      final Either<MainFailure, List<Downloads>> DownloadOption =
          await _downloadsRepo.getDownloadsImages();
      log(DownloadOption.toString());
      emit(DownloadOption.fold(
          (failure) => state.copyWith(
              isloading: false,
              downloadFailureOrSuccessOption: some(left(failure))),
          (success) => state.copyWith(
              isloading: false,
              downloads: success,
              downloadFailureOrSuccessOption: some(right(success)))));
    });
  }
}
