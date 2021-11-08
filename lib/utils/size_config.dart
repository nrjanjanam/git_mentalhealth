import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum DEVICETYPE { mobile, tablet, desktop }

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static Orientation? orientation;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  static double? _safeAreaHorizontal;
  static double? _safeAreaVertical;
  static double? safeBlockHorizontal;
  static double? safeBlockVertical;
  static double? devicePixelRatio;
  static DEVICETYPE? devicetype;
  static Size? mainSize;
  static ui.Size? size;

  /// Initialize Size Config
  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    mainSize = _mediaQueryData?.size;
    orientation = MediaQuery.of(context).orientation;
    screenWidth = (_mediaQueryData?.size.width)! -
        ((_mediaQueryData?.padding.left)! + (_mediaQueryData?.padding.right)!);
    screenHeight = _mediaQueryData?.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;

    _safeAreaHorizontal =
        (_mediaQueryData?.padding.left)! + (_mediaQueryData?.padding.right)!;
    _safeAreaVertical =
        (_mediaQueryData?.padding.top)! + (_mediaQueryData?.padding.bottom)!;

    safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal!) / 100;
    safeBlockVertical = (screenHeight! - _safeAreaVertical!) / 100;

    /// Calculate DeviceInfo
    devicePixelRatio = ui.window.devicePixelRatio;
    size = ui.window.physicalSize;

    if ((size?.width)! >= 1920 || (size?.height)! >= 1920) {
      devicetype = DEVICETYPE.desktop;
    } else if ((size?.width)! >= 1000 || (size?.height)! >= 1000) {
      devicetype = DEVICETYPE.tablet;
    } else {
      devicetype = DEVICETYPE.mobile;
    }
  }

  /// List Box Size
  static double getListBlockSize(
    double blockNo,
    double margin,
    double dividerSpace,
  ) {
    if (devicetype == DEVICETYPE.mobile) {
      return (screenWidth! - margin - dividerSpace) / blockNo - 1.4;
    } else {
      return 110;
    }
  }
}

Size? screenSize;
double defaultScreenWidth = 400.0;
double defaultScreenHeight = 810.0;
double screenWidth = defaultScreenWidth;
double screenHeight = defaultScreenHeight;

class Constant {
  /*Padding & Margin Constants*/

  static double sizeExtraSmall = 5.0;
  static double sizeDefault = 8.0;
  static double sizeSmall = 10.0;
  static double sizeMedium = 15.0;
  static double sizeLarge = 20.0;
  static double sizeXL = 30.0;
  static double sizeXXL = 40.0;
  static double sizeXXXL = 50.0;
  static double size60 = 60.0;
  static double size70 = 70.0;
  static double size75 = 75.0;
  static double size100 = 100.0;
  static double size175 = 175.0;
  static double size200 = 200.0;

  /*Screen Size dependent Constants*/
  static double screenWidth = screenWidth;
  static double screenHeight = screenHeight;
  static double screenWidthHalf = screenWidth / 2;
  static double screenWidthThird = screenWidth / 3;
  static double screenWidthFourth = screenWidth / 4;
  static double screenWidthFifth = screenWidth / 5;
  static double screenWidthSixth = screenWidth / 6;
  static double screenWidthTenth = screenWidth / 10;

  static double screenHeightHalf = screenHeight / 2;
  static double screenHeightThird = screenHeight / 3;
  static double screenHeightForth = screenHeight / 4;

  /*Image Dimensions*/

  static double defaultIconSize = 80.0;
  static double defaultImageHeight = 120.0;
  static double snackBarHeight = 50.0;
  static double texIconSize = 30.0;

  /*Default Height&Width*/
  static double defaultIndicatorHeight = 5.0;
  static double defaultIndicatorWidth = screenWidthFourth;

  /*EdgeInsets*/
  static EdgeInsets spacingAllDefault = EdgeInsets.all(sizeDefault);
  static EdgeInsets spacingAllSmall = EdgeInsets.all(sizeSmall);

  static void setDefaultSize(context) {
    screenSize = MediaQuery.of(context).size;
    screenWidth = (screenSize?.width)!;
    screenHeight = (screenSize?.height)!;

    sizeLarge = 20.0;
    sizeXL = 30.0;
    sizeXXL = 40.0;
    sizeXXXL = 50.0;
    size60 = 60.0;
    size70 = 70.0;
    size75 = 75.0;
    size100 = 100.0;
    size175 = 175.0;
    size200 = 200.0;

    screenWidthHalf = screenWidth / 2;
    screenWidthThird = screenWidth / 3;
    screenWidthFourth = screenWidth / 4;
    screenWidthFifth = screenWidth / 5;
    screenWidthSixth = screenWidth / 6;
    screenWidthTenth = screenWidth / 10;

    screenHeightForth = screenHeight / 4;

    defaultIconSize = 80.0;
    defaultImageHeight = 120.0;
    snackBarHeight = 50.0;
    texIconSize = 30.0;

    defaultIndicatorHeight = 5.0;
    defaultIndicatorWidth = screenWidthFourth;

    spacingAllDefault = EdgeInsets.all(sizeDefault);
    spacingAllSmall = EdgeInsets.all(sizeSmall);

    FontSize.setDefaultFontSize();
  }

  static void setScreenAwareConstant(context) {
    ScreenUtil.init(
      const BoxConstraints.tightForFinite(),
      designSize: Size(defaultScreenWidth, defaultScreenHeight),
    );

    FontSize.setScreenAwareFontSize();

    /*Padding & Margin Constants*/

    sizeExtraSmall = ScreenUtil().setWidth(5.0).toDouble();
    sizeDefault = ScreenUtil().setWidth(8.0).toDouble();
    sizeSmall = ScreenUtil().setWidth(10.0).toDouble();
    sizeMedium = ScreenUtil().setWidth(15.0).toDouble();
    sizeLarge = ScreenUtil().setWidth(20.0).toDouble();
    sizeXL = ScreenUtil().setWidth(30.0).toDouble();
    sizeXXL = ScreenUtil().setWidth(40.0).toDouble();
    sizeXXXL = ScreenUtil().setWidth(50.0).toDouble();
    size60 = ScreenUtil().setWidth(60.0).toDouble();
    size70 = ScreenUtil().setWidth(70.0).toDouble();
    size75 = ScreenUtil().setWidth(75.0).toDouble();
    size100 = ScreenUtil().setWidth(100.0).toDouble();
    size175 = ScreenUtil().setWidth(175.0).toDouble();
    size200 = ScreenUtil().setHeight(200.0).toDouble();

    /*EdgeInsets*/

    spacingAllDefault = EdgeInsets.all(sizeDefault);
    spacingAllSmall = EdgeInsets.all(sizeSmall);

    /*Screen Size dependent Constants*/
    screenWidthHalf = ScreenUtil.defaultSize.width / 2;
    screenWidthThird = ScreenUtil.defaultSize.width / 3;
    screenWidthFourth = ScreenUtil.defaultSize.width / 4;
    screenWidthFifth = ScreenUtil.defaultSize.width / 5;
    screenWidthSixth = ScreenUtil.defaultSize.width / 6;
    screenWidthTenth = ScreenUtil.defaultSize.width / 10;
    screenHeightForth = ScreenUtil.defaultSize.height / 4;
    screenHeightThird = ScreenUtil.defaultSize.height / 3;
    screenHeightHalf = ScreenUtil.defaultSize.height / 2;

    /*Image Dimensions*/

    defaultIconSize = ScreenUtil().setWidth(80.0).toDouble();
    defaultImageHeight = ScreenUtil().setHeight(120.0).toDouble();
    snackBarHeight = ScreenUtil().setHeight(50.0).toDouble();
    texIconSize = ScreenUtil().setWidth(30.0).toDouble();

    /*Default Height&Width*/
    defaultIndicatorHeight = ScreenUtil().setHeight(5.0).toDouble();
    defaultIndicatorWidth = screenWidthFourth;
  }
}

class FontSize {
  static double s7 = 7.0;
  static double s8 = 8.0;
  static double s9 = 9.0;
  static double s10 = 10.0;
  static double s11 = 11.0;
  static double s12 = 12.0;
  static double s13 = 13.0;
  static double s14 = 14.0;
  static double s15 = 15.0;
  static double s16 = 16.0;
  static double s17 = 17.0;
  static double s18 = 18.0;
  static double s19 = 19.0;
  static double s20 = 20.0;
  static double s21 = 21.0;
  static double s22 = 22.0;
  static double s23 = 23.0;
  static double s24 = 24.0;
  static double s25 = 25.0;
  static double s26 = 26.0;
  static double s27 = 27.0;
  static double s28 = 28.0;
  static double s29 = 29.0;
  static double s30 = 30.0;
  static double s32 = 32.0;
  static double s34 = 34.0;
  static double s36 = 36.0;
  static double s38 = 38.0;
  static double s40 = 40.0;
  static double s48 = 48.0;

  static setDefaultFontSize() {
    s7 = 7.0;
    s8 = 8.0;
    s9 = 9.0;
    s10 = 10.0;
    s11 = 11.0;
    s12 = 12.0;
    s13 = 13.0;
    s14 = 14.0;
    s15 = 15.0;
    s16 = 16.0;
    s17 = 17.0;
    s18 = 18.0;
    s19 = 19.0;
    s20 = 20.0;
    s21 = 21.0;
    s22 = 22.0;
    s23 = 23.0;
    s24 = 24.0;
    s25 = 25.0;
    s26 = 26.0;
    s27 = 27.0;
    s28 = 28.0;
    s29 = 29.0;
    s30 = 30.0;
    s32 = 32.0;
    s34 = 34.0;
    s36 = 36.0;
    s38 = 38.0;
    s48 = 48.0;
  }

  static setScreenAwareFontSize() {
    s7 = ScreenUtil().setSp(7).toDouble();
    s8 = ScreenUtil().setSp(8.0).toDouble();
    s9 = ScreenUtil().setSp(9.0).toDouble();
    s10 = ScreenUtil().setSp(10.0).toDouble();
    s11 = ScreenUtil().setSp(11.0).toDouble();
    s12 = ScreenUtil().setSp(12.0).toDouble();
    s13 = ScreenUtil().setSp(13.0).toDouble();
    s14 = ScreenUtil().setSp(14.0).toDouble();
    s15 = ScreenUtil().setSp(15.0).toDouble();
    s16 = ScreenUtil().setSp(16.0).toDouble();
    s17 = ScreenUtil().setSp(17.0).toDouble();
    s18 = ScreenUtil().setSp(18.0).toDouble();
    s20 = ScreenUtil().setSp(20.0).toDouble();
    s21 = ScreenUtil().setSp(21.0).toDouble();
    s22 = ScreenUtil().setSp(22.0).toDouble();
    s23 = ScreenUtil().setSp(23.0).toDouble();
    s24 = ScreenUtil().setSp(24.0).toDouble();
    s25 = ScreenUtil().setSp(25.0).toDouble();
    s26 = ScreenUtil().setSp(26.0).toDouble();
    s27 = ScreenUtil().setSp(27.0).toDouble();
    s28 = ScreenUtil().setSp(28.0).toDouble();
    s29 = ScreenUtil().setSp(29.0).toDouble();
    s30 = ScreenUtil().setSp(30.0).toDouble();
    s32 = ScreenUtil().setSp(32.0).toDouble();
    s34 = ScreenUtil().setSp(34.0).toDouble();
    s36 = ScreenUtil().setSp(36.0).toDouble();
    s38 = ScreenUtil().setSp(38.0).toDouble();
    s40 = ScreenUtil().setSp(40.0).toDouble();
    s48 = ScreenUtil().setSp(48.0).toDouble();
  }
}

class Dimens {
  static double dimen_0dp = 0;
  static double dimen_1dp = 1;
  static double dimen_2dp = 2;
  static double dimen_3dp = 3;
  static double dimen_4dp = 4;
  static double dimen_5dp = 5;
  static double dimen_6dp = 6;
  static double dimen_7dp = 7;
  static double dimen_8dp = 8;
  static double dimen_9dp = 9;
  static double dimen_10dp = 10;
  static double dimen_11dp = 11;
  static double dimen_12dp = 12;
  static double dimen_13dp = 13;
  static double dimen_14dp = 14;
  static double dimen_15dp = 15;
  static double dimen_16dp = 16;
  static double dimen_17dp = 17;
  static double dimen_18dp = 18;
  static double dimen_19dp = 19;
  static double dimen_20dp = 20;
  static double dimen_22dp = 22;
  static double dimen_24dp = 24;
  static double dimen_25dp = 25;
  static double dimen_26dp = 26;
  static double dimen_30dp = 30;
  static double dimen_35dp = 35;
  static double dimen_37dp = 37;
  static double dimen_38dp = 38;
  static double dimen_40dp = 40;
  static double dimen_45dp = 45;
  static double dimen_50dp = 50;
  static double dimen_55dp = 55;
  static double dimen_60dp = 60;
  static double dimen_65dp = 65;
  static double dimen_70dp = 70;
  static double dimen_75dp = 75;
  static double dimen_80dp = 80;
  static double dimen_85dp = 85;
  static double dimen_90dp = 90;
  static double dimen_100dp = 100;
  static double dimen_110dp = 110;
  static double dimen_120dp = 120;
  static double dimen_130dp = 130;
  static double dimen_140dp = 140;
  static double dimen_150dp = 150;
  static double dimen_160dp = 160;
  static double dimen_170dp = 170;
  static double dimen_180dp = 180;
  static double dimen_200dp = 200;
  static double dimen_300dp = 300;
  static double dimen_400dp = 400;
  static double dimen_500dp = 500;
}
