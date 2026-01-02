import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoely_dashboard/core/widgets/custom_button.dart';
import 'package:shoely_dashboard/core/widgets/custom_text_field.dart';
import 'package:shoely_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:shoely_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:shoely_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:shoely_dashboard/features/add_product/presentation/views/widgets/is_featured.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String productName, productCode, productDescription;
  bool isProductFeatured = false;
  File? imageFile;
  late num productPrice;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'Product Name',
                onSaved: (value) {
                  productName = value!;
                },
              ),
              SizedBox(height: 25),
              CustomTextFormField(
                hintText: 'Product Code',
                onSaved: (value) {
                  productCode = value!.toLowerCase();
                },
              ),
              SizedBox(height: 25),
              CustomTextFormField(
                hintText: 'Product Price',
                onSaved: (value) {
                  productPrice = num.parse(value!);
                },
              ),
              SizedBox(height: 25),
              CustomTextFormField(
                hintText: 'Product description',
                maxLines: 5,
                onSaved: (value) {
                  productDescription = value!;
                },
              ),
              SizedBox(height: 25),
              IsFeatured(
                onChanged: (isFeatured) {
                  isProductFeatured = isFeatured;
                },
              ),
              SizedBox(height: 25),
              ImageField(
                onImageSelected: (image) {
                  imageFile = image;
                },
              ),
              SizedBox(height: 30),
              CustomButton(
                title: 'Add Product',
                onTap: () {
                  if (imageFile != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      AddProductInputEntity addProductInputEntity =
                          AddProductInputEntity(
                            name: productName,
                            productCode: productCode,
                            description: productDescription,
                            price: productPrice,
                            isFeatured: isProductFeatured,
                            imageFile: imageFile!,
                          );
                      context.read<AddProductCubit>().addProduct(
                        addProductInputEntity,
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Please select an image for the product.',
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
