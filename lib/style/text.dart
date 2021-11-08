import 'package:flutter/material.dart';
import 'package:git_mentalhealth/utils/color_constants.dart';
import 'package:git_mentalhealth/utils/size_config.dart';

/// enum for font weight
enum FONTWEIGHT { light, regular, medium, bold }

extension FONTWEIGHTEXT on FONTWEIGHT {
  FontWeight? get value {
    switch (this) {
      case FONTWEIGHT.light:
        return FontWeight.w300;
      case FONTWEIGHT.medium:
        return FontWeight.w500;
      case FONTWEIGHT.bold:
        return FontWeight.w600;
      default:
        return null;
    }
  }
}

/// MOBILE sizes
const mobileTypeScale = {
  "D1": 50.0,
  "D2": 42.0,
  "h1": 36.0,
  "h2": 28.0,
  "h3": 24.0,
  "h4": 20.0,
  "h5": 16.0,
  "h6": 14.0,
  "B1": 16.0,
  "B2": 14.0,
  "CAPTION": 12.0,
  "OVERLINE": 10.0,
  "18": 18.0,
  "8": 8.0,
};

/// TABLET sizes
const tabletTypeScale = {
  "D1": 68.0,
  "D2": 48.0,
  "h1": 42.0,
  "h2": 32.0,
  "h3": 26.0,
  "h4": 22.0,
  "h5": 16.0,
  "h6": 14.0,
  "B1": 16.0,
  "B2": 14.0,
  "CAPTION": 14.0,
  "OVERLINE": 12.0,
  "18": 20.0,
  "8": 10.0
};

/// DEKSTOP sizes
const desktopTypeScale = {
  "D1": 68.0,
  "D2": 48.0,
  "h1": 42.0,
  "h2": 32.0,
  "h3": 26.0,
  "h4": 22.0,
  "h5": 16.0,
  "h6": 14.0,
  "B1": 16.0,
  "B2": 14.0,
  "CAPTION": 14.0,
  "OVERLINE": 12.0,
  "18": 20.0,
  "8": 10.0
};

extension DEVICETYPEEXT on DEVICETYPE {
  Map<String, double>? get typescale {
    switch (this) {
      case DEVICETYPE.mobile:
        return mobileTypeScale;
      case DEVICETYPE.tablet:
        return tabletTypeScale;
      case DEVICETYPE.desktop:
        return desktopTypeScale;
      default:
        return null;
    }
  }
}

TextStyle? appTextStyle(
    {String type = "B1",
    DEVICETYPE device = DEVICETYPE.mobile,
    FONTWEIGHT weight = FONTWEIGHT.medium,
    Color color = kPrimaryColor}) {
  double? fontSize;

  /// Font Size
  device = SizeConfig.devicetype!;
  if (device == DEVICETYPE.mobile) {
  } else if (device == DEVICETYPE.tablet) {
    fontSize = tabletTypeScale[type]!;
  } else {
    fontSize = desktopTypeScale[type]!;
  }

  /// final style
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: weight.value!,
    // fontFamily: "JioType",
  );
}
