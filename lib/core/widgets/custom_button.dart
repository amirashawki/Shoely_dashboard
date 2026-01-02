import 'package:flutter/material.dart';
import 'package:shoely_dashboard/core/utils/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onTap,
    this.borderRadius,
    this.verticalPadding,
  });
  final String title;
  final double? verticalPadding;
  @override
  final double? borderRadius;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.kprimaryColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 32),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 10),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
