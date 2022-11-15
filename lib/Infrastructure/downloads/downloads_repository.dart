import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_demo/Domain/core/api_end_points.dart';
import 'package:netflix_demo/Domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_demo/Domain/downloads/i_downloads_repo.dart';
import 'package:netflix_demo/Domain/downloads/models/downloads.dart';

@LazySingleton(as: IDownloadsRepo)
class DownloadsRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(API_Key_Points.download);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadlist = (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();

        log(downloadlist.toString());
        // final List<Downloads> downloadlist = [];
        // log(response.data.toString());
        // for (final raw in response.data) {
        //   downloadlist.add(Downloads.fromJson(raw as Map<String, dynamic>));
        // }

        return right(downloadlist);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clintFailure());
    }
  }
}
