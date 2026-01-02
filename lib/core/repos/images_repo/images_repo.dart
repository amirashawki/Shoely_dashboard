import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:shoely_dashboard/core/errors/failures.dart';

abstract class ImagesRepo {
  Future <Either<Failure, String>> uploadImage(File imageFile);
}