import 'package:dawaay/constants/dawaay_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onTap;
  final RxBool isLoading;
  final String text;

  const SubmitButton(
    this.text, {
    super.key,
    required this.onTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading.value ? () {} : onTap,
      child: Card(
        elevation: 10.sp,
        color: DawaayColors.kBlueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.sp),
          side: BorderSide(
            color: Colors.white,
            width: 4.sp,
          ),
        ),
        child: Obx(
          () {
            return isLoading.value
                ? SizedBox(
                    height: 60.h,
                    width: 60.w,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  )
                : SizedBox(
                    height: 60.h,
                    width: 200.w,
                    child: Center(
                      child: Text(
                        text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
