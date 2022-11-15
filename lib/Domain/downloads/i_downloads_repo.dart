import 'package:dartz/dartz.dart';
import 'package:netflix_demo/Domain/core/failures/main_failure.dart';
import 'package:netflix_demo/Domain/downloads/models/downloads.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
