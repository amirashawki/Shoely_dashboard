import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:shoely_dashboard/core/errors/failures.dart';
import 'package:shoely_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:shoely_dashboard/core/services/storage_services.dart';
import 'package:shoely_dashboard/core/utils/backend_endpoint.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageServices storageServices;

  ImagesRepoImpl({required this.storageServices});
  @override
  Future<Either<Failure, String>> uploadImage(File imageFile) async {
    try {
      String urlImage = await storageServices.uploadImage(
        imageFile,
        BackendEndpoint.images,
      );
      return right(urlImage);
    } catch (e) {
      return left(ServerFailure('failed to upload image'));
    }
  }
}
