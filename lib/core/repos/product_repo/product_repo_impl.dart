import 'package:dartz/dartz.dart';
import 'package:shoely_dashboard/core/errors/failures.dart';
import 'package:shoely_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:shoely_dashboard/core/services/database_services.dart';
import 'package:shoely_dashboard/core/utils/backend_endpoint.dart';
import 'package:shoely_dashboard/features/add_product/data/models/add_product_Input_model.dart';
import 'package:shoely_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseServices databaseServices;

  ProductRepoImpl({required this.databaseServices});
  @override
  Future<Either<Failure, void>> addProduct(
    AddProductInputEntity addProductInputEntity,
  ) async {
    try {
      await databaseServices.addData(
        path: BackendEndpoint.addProduct,
        data: AddProductInputModel.fromEntity(addProductInputEntity).toJson(),
      );
      return const Right(null);
    }  catch (e) {
      return 
       Left(ServerFailure('failed to add products'));
    }
  }
}
