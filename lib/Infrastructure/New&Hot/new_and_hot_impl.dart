import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_demo/Domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_demo/Domain/new_and_hot/model/new_and_hot.dart';
import 'package:netflix_demo/Domain/new_and_hot/new_and_hot_service.dart';

import '../../Domain/core/api_end_points.dart';
@LazySingleton(as: NewAndHotService)
class NewAndHotImplimentation implements NewAndHotService{
  @override
  Future<Either<MainFailure, NewAndHot>> getNewAndHotMovieData()async {
   try {
      final Response response = await Dio(BaseOptions()).get(
        API_Key_Points.NewAndHotMovie
       
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = NewAndHot.fromJson(response.data);
       
        return right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clintFailure());
    }
  }

  @override
  Future<Either<MainFailure, NewAndHot>> getNewAndHotTVData() async{
     try {
      final Response response = await Dio(BaseOptions()).get(
        API_Key_Points.NewAndHotTV
       
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = NewAndHot.fromJson(response.data);
       
        return right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clintFailure());
    }
  }
  
}