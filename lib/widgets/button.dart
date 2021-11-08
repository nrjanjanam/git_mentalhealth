import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_mentalhealth/style/text.dart';
import 'package:git_mentalhealth/utils/color_constants.dart';

class UiButton extends StatelessWidget {
  final String? title;
  final Function? onPress;
  final BUTTONSTATE? state;
  final BUTTONTYPE? btnType;
  final BUTTONSIZE? size;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? textColor;
  final bool? isRounded;
  final double? buttonWidth;

  const UiButton({
    Key? key,
    this.buttonWidth,
    this.title,
    this.onPress,
    this.state = BUTTONSTATE.active,
    this.btnType,
    this.size = BUTTONSIZE.medium,
    this.suffixIcon,
    this.prefixIcon,
    this.borderColor = kPrimaryColor,
    this.isRounded = false,
    this.backgroundColor = kPrimaryColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => state == BUTTONSTATE.active ? onPress : null,
      child: Container(
        width: buttonWidth ?? double.infinity,
        height: (size?.btnData?.height)!,
        decoration: _btnBoxDecoration(),
        child: _getChild(),
      ),
    );
  }

  Widget _getChild() {
    // Check for loading state
    if (state == BUTTONSTATE.loading) {
      return const Center(
          heightFactor: 0.2,
          widthFactor: 0.2,
          child: CircularProgressIndicator(
            color: kPrimaryColor,
          ));
    }

    switch (btnType) {
      case BUTTONTYPE.secondary:
      case BUTTONTYPE.tertiary:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null) prefixIcon!,
            Text(
              title!,
              style: appTextStyle(
                  type: (size?.btnData?.titleType)!,
                  weight: FONTWEIGHT.medium,
                  color: textColor ?? kPrimaryColor),
            ),
            if (suffixIcon != null) suffixIcon!,
          ],
        );

      default:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null) prefixIcon!,
            Text(
              title!,
              style: appTextStyle(
                  type: (size?.btnData?.titleType)!,
                  weight: FONTWEIGHT.medium,
                  color: textColor ?? Colors.white),
            ),
            if (suffixIcon != null) suffixIcon!,
          ],
        );
    }
  }

  BoxDecoration _btnBoxDecoration() {
    // box decoration for button
    switch (btnType) {
      case BUTTONTYPE.secondary:
        return BoxDecoration(
          color: backgroundColor ?? Colors.white,
          border: Border.all(
            color:
                state == BUTTONSTATE.disable ? kbtnDisableColor : borderColor!,
          ),
          borderRadius: BorderRadius.circular(
            (size?.btnData?.cornerCurve)!,
          ),
        );

      case BUTTONTYPE.tertiary:
        return const BoxDecoration();

      default:
        return BoxDecoration(
          color:
              state == BUTTONSTATE.disable ? kbtnDisableColor : backgroundColor,
          borderRadius: BorderRadius.circular(
            (size?.btnData?.cornerCurve)!,
          ),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: kBtnShadowColor,
              blurRadius: 4.0,
              offset: Offset(0.0, 2.0),
            )
          ],
        );
    }
  }
}

enum BUTTONSTATE { active, disable, loading, pressed }
enum BUTTONTYPE { secondary, tertiary }
enum BUTTONSIZE { large, medium, small, extraSmall }

class ButtonData {
  String? titleType;
  double? cornerCurve;
  double? height;

  ButtonData({
    this.titleType,
    this.cornerCurve,
    this.height,
  });

  ButtonData copyWith({
    String? titleType,
    double? cornerCurve,
    double? height,
  }) {
    return ButtonData(
      titleType: titleType ?? this.titleType,
      cornerCurve: cornerCurve ?? this.cornerCurve,
      height: height ?? this.height,
    );
  }
}

extension BUTTONDATA on BUTTONSIZE {
  ButtonData? get btnData {
    switch (this) {
      case BUTTONSIZE.large:
        return ButtonData(
          titleType: "B1",
          height: 48.0,
          cornerCurve: 8.0,
        );
      case BUTTONSIZE.medium:
        return ButtonData(
          titleType: "B1",
          height: 40.0,
          cornerCurve: 8.0,
        );
      case BUTTONSIZE.small:
        return ButtonData(
          titleType: "B2",
          height: 32.0,
          cornerCurve: 4.0,
        );
      case BUTTONSIZE.extraSmall:
        return ButtonData(
          titleType: "CAPTION",
          height: 24.0,
          cornerCurve: 4.0,
        );
      default:
        return ButtonData(
          titleType: "B1",
          height: 40.0,
          cornerCurve: 8.0,
        );
    }
  }
}
