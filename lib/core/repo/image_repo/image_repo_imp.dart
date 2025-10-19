import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dishboard_fruits_app/core/errors/failure.dart';
import 'package:dishboard_fruits_app/core/helper/utiles/endpoint.dart';
import 'package:dishboard_fruits_app/core/repo/image_repo/image_repo.dart';
import 'package:dishboard_fruits_app/core/services/storage_service.dart';

class ImageRepoImp implements ImageRepo {
  final StorageService storageService;

  ImageRepoImp(this.storageService);
  @override
  Future<Either<Failure, String>> imageUpload(File image) async {
    try {
      String url = await storageService.uploadImage(image, Endpoint.image);
      return right(url);
    } catch (e) {
      print("❌ Upload Error: $e");
      return left(ServerFailure(e.toString()));
    }
  }
}
