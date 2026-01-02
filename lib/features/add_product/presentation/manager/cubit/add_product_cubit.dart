import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoely_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:shoely_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:shoely_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required this.productRepo, required this.imagesRepo})
    : super(AddProductInitial());
  final ImagesRepo imagesRepo;
  final ProductRepo productRepo;
  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(addProductInputEntity.imageFile);
    result.fold(
      (f) {
        emit(AddProductFailure(errMessage: f.errMessge));
      },
      (url) async {
        addProductInputEntity.imageUrl = url;
        var result = await productRepo.addProduct(addProductInputEntity);
        result.fold(
          (f) {
            emit(AddProductFailure(errMessage: f.errMessge));
          },
          (product) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
