


import 'package:dartz/dartz.dart';
import 'package:netflix_demo/Domain/core/failures/main_failure.dart';
import 'package:netflix_demo/Domain/new_and_hot/model/new_and_hot.dart';

abstract class NewAndHotService{
    Future<Either<MainFailure,NewAndHot>>getNewAndHotMovieData();
    Future<Either<MainFailure,NewAndHot>>getNewAndHotTVData();
}