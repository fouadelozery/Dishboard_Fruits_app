import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dishboard_fruits_app/core/errors/failure.dart';
import 'package:dishboard_fruits_app/core/repo/image_repo/image_repo.dart';

class ImageRepoImp  implements ImageRepo{
  @override
  Future<Either<Failure, String>> imageUpload(File image) {

  }
}