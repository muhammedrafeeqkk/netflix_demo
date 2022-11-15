import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_demo/Domain/core/failures/main_failure.dart';
import 'package:netflix_demo/Domain/downloads/i_downloads_repo.dart';
import 'package:netflix_demo/Domain/downloads/models/downloads.dart';
import 'package:netflix_demo/Domain/search/model/search_reppo/search_reppo.dart';
import 'package:netflix_demo/Domain/search/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadServices;
  final SearchService _searchService;
  SearchBloc(this._downloadServices, this._searchService)
      : super(SearchState.initial()) {
//idle state

    on<Initialize>((event, emit) async {
      if (state.idlelist.isNotEmpty) {
        emit(
          SearchState(
              searchResultList: [],
              idlelist: state.idlelist,
              isLoading: false,
              isError: false),
        );
        return;
      }
      emit(
        SearchState(
            searchResultList: [],
            idlelist: [],
            isLoading: true,
            isError: false),
      );

      // get trending

      final _result = await _downloadServices.getDownloadsImages();
      final _state = _result.fold((MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idlelist: [],
            isLoading: false,
            isError: true);
      }, (List<Downloads> list) {
        return SearchState(
            searchResultList: [],
            idlelist: list,
            isLoading: false,
            isError: false);
      });
      //show ui
      emit(_state);
    });

    //SearchResultState

    on<SearchMovie>((event, emit) async {
      log('searching ${event.movieQuery}');
      // call search movie api
      final _result =
          await _searchService.SearchMovies(movieQuery: event.movieQuery);
      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
              searchResultList: [],
              idlelist: [],
              isLoading: false,
              isError: true);
        },
        (SearchReppo r) {
          return SearchState(
              searchResultList: r.results,
              idlelist: [],
              isLoading: false,
              isError: false);
        },
      );

      //show ui
      emit(_state);
    });
  }
}
