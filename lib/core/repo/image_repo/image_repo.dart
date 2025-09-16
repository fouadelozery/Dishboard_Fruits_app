import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dishboard_fruits_app/core/errors/failure.dart';

abstract class ImageRepo {
  Future<Either<Failure,String>> imageUpload(File image);
}
