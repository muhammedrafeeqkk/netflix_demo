import 'package:dartz/dartz.dart';
import 'package:netflix_demo/Domain/core/failures/main_failure.dart';
import 'package:netflix_demo/Domain/search/model/search_reppo/search_reppo.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchReppo>> SearchMovies(
      {required String movieQuery});
}
