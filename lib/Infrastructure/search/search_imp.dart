import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_demo/Domain/search/model/search_reppo/search_reppo.dart';
import 'package:netflix_demo/Domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_demo/Domain/search/search_service.dart';

import '../../Domain/core/api_end_points.dart';

@LazySingleton(as: SearchService)
class searchImpl implements SearchService {
  @override
  Future<Either<MainFailure, SearchReppo>> SearchMovies(
      {required String movieQuery}) async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        API_Key_Points.search,
        queryParameters: {
          'query': movieQuery,
        },
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchReppo.fromJson(response.data);
        // final downloadlist = (response.data['results'] as List).map((e) {
        // return SearchReppo.fromJson(e);
        // }).toList();

        // log(result.toString());
        // final List<Downloads> downloadlist = [];
        // log(response.data.toString());
        // for (final raw in response.data) {
        //   downloadlist.add(Downloads.fromJson(raw as Map<String, dynamic>));
        // }

        return right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clintFailure());
    }
  }
}
