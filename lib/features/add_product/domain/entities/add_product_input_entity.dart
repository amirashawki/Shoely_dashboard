import 'dart:io';

import 'package:shoely_dashboard/features/add_product/domain/entities/review_entity.dart';

class AddProductInputEntity {
  final String name;
  final String description;

  final num price;
  File imageFile;
  String? imageUrl;
  final String productCode;
  final bool isFeatured;
  final num size;
  final List<ReviewEntity> reviews;

  AddProductInputEntity({
    required this.name,
    required this.description,
    required this.price,
    required this.imageFile,
    this.imageUrl,
    required this.productCode,
    required this.isFeatured,
    required this.size,
    required this.reviews,
  });
}
