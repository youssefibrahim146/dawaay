import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GapWidget extends StatelessWidget {
  final double size;

  const GapWidget(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.h,
      width: size.w,
    );
  }
}
