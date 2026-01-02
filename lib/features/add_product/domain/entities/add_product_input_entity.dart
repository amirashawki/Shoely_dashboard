import 'dart:io';

class AddProductInputEntity {
  final String name;
  final String description;

  final num price;
  File imageFile;
  String? imageUrl;
  final String productCode;
  final bool isFeatured;
  final num size;

  AddProductInputEntity({
    required this.name,
    required this.description,
    required this.price,
    required this.imageFile,
    this.imageUrl,
    required this.productCode,
    required this.isFeatured,
    required this.size,
  });
}
