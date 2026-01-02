import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoely_dashboard/core/utils/app_router.dart';
import 'package:shoely_dashboard/core/widgets/custom_button.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            title: 'Add product',
            onTap: () {
              GoRouter.of(context).push(AppRouter.kAddProductView);
            },
          ),
        ],
      ),
    );
  }
}
