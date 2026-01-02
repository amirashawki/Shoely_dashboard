import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shoely_dashboard/core/helper/error_snack_bar.dart';
import 'package:shoely_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:shoely_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:shoely_dashboard/core/services/get_it_services.dart';
import 'package:shoely_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:shoely_dashboard/features/add_product/presentation/views/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      body: BlocProvider(
        create: (context) => AddProductCubit(
          imagesRepo: getIt.get<ImagesRepo>(),
          productRepo: getIt.get<ProductRepo>(),
        ),
        child: AddBroductViewBlocConsumer(),
      ),
    );
  }
}

class AddBroductViewBlocConsumer extends StatelessWidget {
  const AddBroductViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          return errorSnackBar(context, 'Add product Successfuly');
        } else if (state is AddProductFailure) {
          return errorSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddProductLoading ? true : false,
          child: AddProductViewBody(),
        );
      },
    );
  }
}
