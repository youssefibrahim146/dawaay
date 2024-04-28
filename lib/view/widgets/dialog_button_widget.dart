import 'package:dawaay/constans/dawaay_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color? white;
  final VoidCallback onTap;

  const DialogButtonWidget({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
    this.white,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 40.sp,
        width: 100.sp,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
            color: white ?? DawaayColors.kBlueColor,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
