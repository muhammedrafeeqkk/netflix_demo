part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required List<SearchResultData> searchResultList,
    required List<Downloads> idlelist,
    required bool isLoading,
    required bool isError,
  }) = _SearchState;

  factory SearchState.initial() => SearchState(
        searchResultList: [],
        idlelist: [],
        isLoading: false,
        isError: false,
      );
}
