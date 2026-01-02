import 'package:flutter/material.dart';
import 'package:shoely_dashboard/core/utils/app_color.dart';
import 'package:shoely_dashboard/features/add_product/presentation/views/widgets/custom_check_box.dart';

class IsFeatured extends StatefulWidget {
  const IsFeatured({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<IsFeatured> createState() => _IsFeaturedState();
}

class _IsFeaturedState extends State<IsFeatured> {
  bool isAgree = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isAgree,
          onChanged: (value) {
            setState(() {
              isAgree = value;
              widget.onChanged(value);
            });
          },
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: 'is Featured Product',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xff707B81),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
