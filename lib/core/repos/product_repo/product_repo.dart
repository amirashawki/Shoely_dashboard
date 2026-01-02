 import 'package:dartz/dartz.dart';
import 'package:shoely_dashboard/core/errors/failures.dart';
import 'package:shoely_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, void>> addProduct(AddProductInputEntity addProductInputEntity);
 }