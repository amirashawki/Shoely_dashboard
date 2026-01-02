import 'dart:io';

import 'package:shoely_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class AddProductInputModel {
  final String name;
  final String description;

  final num price;
  final File imageFile;
  final String? imageUrl;
  final String productCode;
  final bool isFeatured;
  final num size;

  AddProductInputModel({
    required this.name,
    required this.description,
    required this.price,
    required this.imageFile,
    this.imageUrl,
    required this.productCode,
    required this.isFeatured,
    required this.size,
  });
  factory AddProductInputModel.fromEntity(
    AddProductInputEntity addProductInputEntity,
  ) {
    return AddProductInputModel(
      name: addProductInputEntity.name,
      description: addProductInputEntity.description,
      price: addProductInputEntity.price,
      imageFile: addProductInputEntity.imageFile,
      productCode: addProductInputEntity.productCode,
      isFeatured: addProductInputEntity.isFeatured,
      imageUrl: addProductInputEntity.imageUrl,
      size: addProductInputEntity.size,
    );
  }
  toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'productCode': productCode,
      'isFeatured': isFeatured,
      'size': size,
    };
  }
}
