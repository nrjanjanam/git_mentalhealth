import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_mentalhealth/common/style/centralize_strings.dart';
import 'package:sizer/sizer.dart';

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getAdaptiveTextSize(BuildContext context, double value, String type) {
    return (value / 720) * MediaQuery.of(context).size.height;
  }

  getAdaptiveSize(BuildContext context, double value, String type) {
    // return value.sp;
    // 720 is medium screen height
    if (type == CentralizeString.sP) {
      return value.sp;
    } else if (type == CentralizeString.W) {
      return value.w;
    } else if (type == CentralizeString.H) {
      return value.w;
    } else {
      return (value / 720) * MediaQuery.of(context).size.height;
    }
  }
}

abstract class SizeElementSP {
  static final double small = 10.0.sp;
  static final double medium = 12.0.sp;
  static final double large = 16.0.sp;

  static final double applicationSpace = (15 / 720) * Get.height;
  static final double headingSpace = 4.0.w;
  static final double subHeadingSpace = 2.0.w;
  //static final double marginLeftRight = (20 / 720) * Get.height;

  static final double sp8 = 8.0.sp;
  static final double sp9 = 9.0.sp;
  static final double sp10 = 10.0.sp;
  static final double sp11 = 11.0.sp;
  static final double sp12 = 12.0.sp;
  static final double sp13 = 13.0.sp;
  static final double sp14 = 14.0.sp;
  static final double sp15 = 15.0.sp;
  static final double sp16 = 16.0.sp;
  static final double sp17 = 17.0.sp;
  static final double sp18 = 18.0.sp;
  static final double sp19 = 19.0.sp;
  static final double sp20 = 20.0.sp;
  static final double sp26 = 26.0.sp;
}
