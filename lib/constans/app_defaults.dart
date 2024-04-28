import 'package:dawaay/constans/dawaay_colors.dart';
import 'package:dawaay/constans/dawaay_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../view/widgets/dialog_button_widget.dart';
import '../view/widgets/gap_widget.dart';

class AppDefaults {
  static defaultDialogWithConfirmAndCancel({
    required String title,
    required Widget subTitle,
    required RxBool isLoading,
    required String secondButtonText,
    required VoidCallback secondButtonClick,
  }) {
    Get.defaultDialog(
      backgroundColor: DawaayColors.kBlueColor,
      barrierDismissible: false,
      title: title,
      titleStyle: TextStyle(
        color: Colors.white,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      titlePadding: EdgeInsets.only(
        top: 25.sp,
      ),
      radius: 15.sp,
      content: Column(
        children: [
          const GapWidget(10),
          subTitle,
          const GapWidget(25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DialogButtonWidget(
                text: AppStrings.cancelText,
                color: Colors.white,
                onTap: () => Get.back(),
              ),
              Obx(
                () => isLoading == false
                    ? DialogButtonWidget(
                        text: secondButtonText,
                        color: DawaayColors.kBlueColor,
                        onTap: secondButtonClick,
                        white: Colors.white,
                      )
                    : CircleAvatar(
                        radius: 20.sp,
                        backgroundColor: DawaayColors.kBlueColor,
                        child: Container(
                          padding: EdgeInsets.all(10.sp),
                          child: const CircularProgressIndicator(
                              color: Colors.white),
                        ),
                      ),
              ),
            ],
          ),
          const GapWidget(10),
        ],
      ),
    );
  }

  static defaultDialogWithOut(title, subTitle, {bool? dismissible}) {
    Get.defaultDialog(
      backgroundColor: DawaayColors.kBlueColor,
      barrierDismissible: dismissible ?? true,
      title: title,
      titleStyle: TextStyle(
        color: Colors.white,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      titlePadding: EdgeInsets.only(top: 25.sp),
      onWillPop: () async => dismissible ?? true,
      radius: 15.sp,
      content: Column(
        children: [
          const GapWidget(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static defaultBottomSheet(List<Widget> widgets,
      {double? height, bool? isDismissible}) {
    Get.bottomSheet(
      backgroundColor: DawaayColors.kBlueColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.sp)),
      ),
      isDismissible: isDismissible ?? false,
      enterBottomSheetDuration: const Duration(
        milliseconds: 500,
      ),
      exitBottomSheetDuration: const Duration(
        milliseconds: 500,
      ),
      SizedBox(
        height: height ?? 550.h,
        child: SafeArea(
          child: WillPopScope(
            onWillPop: () async => isDismissible ?? false,
            child: Center(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(children: widgets),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static OutlineInputBorder defaultOutlineInputBorder(double radius,
      {Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius.sp),
      borderSide: BorderSide(color: color ?? DawaayColors.kBlueColor),
    );
  }

  static Future<bool?> defaultToast(String text) {
    return Fluttertoast.showToast(
      msg: text,
      backgroundColor: DawaayColors.kBlueColor,
      textColor: Colors.white,
      fontSize: 14.sp,
    );
  }
}
