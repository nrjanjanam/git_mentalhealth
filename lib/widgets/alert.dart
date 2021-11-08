import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_mentalhealth/style/adaptive_text.dart';
import 'package:git_mentalhealth/style/centralize_strings.dart';
import 'package:git_mentalhealth/style/text.dart';
import 'package:git_mentalhealth/utils/assets_file.dart';
import 'package:git_mentalhealth/utils/color_constants.dart';
import 'package:git_mentalhealth/widgets/button.dart';
import 'package:git_mentalhealth/widgets/spaces.dart';

class Alert {
  static showSuccessDialogWithImage(
      {@required BuildContext? context,
      @required message,
      messageStyle,
      buttonCallback,
      imageIcon,
      needNegativeButton = false,
      negativeButtonCallback,
      messageTextAlign = TextAlign.center,
      String? positiveButtonText,
      String? negativeButtonText,
      String? heading,
      TextStyle? headingStyle,
      bool needExpandedButtons = false,
      bool bluePositiveButton = false}) {
    showDialogWithImage(
      context: context!,
      icon: Image.asset(
        imageIcon ?? imgSuccessIcon,
        height: const AdaptiveTextSize()
            .getAdaptiveSize(Get.context!, 80, CentralizeString.L),
        width: const AdaptiveTextSize()
            .getAdaptiveSize(Get.context!, 80, CentralizeString.L),
      ),
      message: message,
      messageTextAlign: messageTextAlign,
      messageStyle: messageStyle ??
          TextStyle(
            color: kCoral90,
            fontWeight: FONTWEIGHT.light.value,
          ),
      heading: heading ?? "",
      headingStyle: headingStyle!,
      footer: Padding(
        padding: needExpandedButtons
            ? const EdgeInsets.only(left: 20.0, right: 20.0)
            : EdgeInsets.zero,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (needNegativeButton)
            if (needExpandedButtons)
              Expanded(
                child: UiButton(
                  backgroundColor: Colors.white,
                  title: negativeButtonText ?? "Cancel",
                  onPress: negativeButtonCallback ??
                      () {
                        Navigator.of(context, rootNavigator: true)
                            .pop('dialog');
                      },
                  isRounded: true,
                ),
              ),
          if (needNegativeButton)
            if (!needExpandedButtons)
              UiButton(
                backgroundColor: Colors.white,
                title: negativeButtonText ?? "Cancel",
                onPress: negativeButtonCallback ??
                    () {
                      Navigator.of(context, rootNavigator: true).pop('dialog');
                    },
                isRounded: true,
              ),
          kHorizontalSpace(width: needNegativeButton ? 20.0 : 0.0),
          if (needExpandedButtons)
            Expanded(
              child: UiButton(
                textColor: bluePositiveButton ? Colors.white : kPrimaryColor,
                backgroundColor:
                    bluePositiveButton ? kPrimaryColor : Colors.white,
                title: positiveButtonText ?? "OK",
                onPress: buttonCallback ??
                    () {
                      Navigator.of(context, rootNavigator: true).pop('dialog');
                    },
                isRounded: true,
              ),
            ),
          if (!needExpandedButtons)
            UiButton(
              textColor: bluePositiveButton ? Colors.white : kPrimaryColor,
              backgroundColor:
                  bluePositiveButton ? kPrimaryColor : Colors.white,
              title: positiveButtonText ?? "OK",
              onPress: buttonCallback ??
                  () {
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                  },
              isRounded: true,
            ),
        ]),
      ),
    );
  }
}

showDialogWithImage(
    {@required BuildContext? context,
    @required Widget? icon,
    @required String? message,
    TextStyle? messageStyle,
    messageTextAlign,
    String heading = "",
    TextStyle? headingStyle,
    String? positiveButtonText,
    TextStyle? positiveButtonStyle,
    Color? positiveButtonColor,
    RoundedRectangleBorder? positiveButtonRoundCorner,
    GestureTapCallback? positiveButtonCallBack,
    String? negativeButtonText,
    TextStyle? negativeButtonStyle,
    Color? negativeButtonColor,
    RoundedRectangleBorder? negativeButtonRoundCorner,
    bool barrierDismissible = false,
    GestureTapCallback? negativeButtonCallBack,
    Widget? footer}) {
  showDialog(
    context: context!,
    barrierDismissible: barrierDismissible,
    builder: (cTxt) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 5,
      insetPadding:
          const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            kVerticalSpace(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(child: icon),
                      kVerticalSpace(height: 10.0),
                      if (heading != "")
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            heading,
                            textScaleFactor: 1.0,
                            textAlign: messageTextAlign ?? TextAlign.center,
                            style: headingStyle ??
                                appTextStyle(
                                  weight: FONTWEIGHT.bold,
                                  type: "B1",
                                ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          message!,
                          textScaleFactor: 1.0,
                          textAlign: messageTextAlign ?? TextAlign.center,
                          style: messageStyle ??
                              appTextStyle(
                                weight: FONTWEIGHT.light,
                                type: "B1",
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                kVerticalSpace(height: 10.0),
              ],
            ),
            kVerticalSpace(height: 20.0),
            if (footer != null)
              footer
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // if(negativeButtonText != null)
                  //   SizedBox(width: 10),

                  if (negativeButtonText != null)
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        height: 45,
                        child: TextButton(
                          child: Text(
                            negativeButtonText,
                            textScaleFactor: 1.0,
                            style: negativeButtonStyle ??
                                appTextStyle(
                                  weight: FONTWEIGHT.medium,
                                  type: "B1",
                                ),
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  negativeButtonColor ?? Colors.white,
                              shape: negativeButtonRoundCorner ??
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(
                                          color: kPrimaryColor))),
                          onPressed: negativeButtonCallBack ??
                              () {
                                Navigator.of(cTxt).pop();
                              },
                        ),
                      ),
                    ),

                  SizedBox(width: negativeButtonText != null ? 10 : 20),
                  if (positiveButtonText != null)
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: TextButton(
                          child: Text(positiveButtonText,
                              textScaleFactor: 1.0,
                              style: positiveButtonStyle ??
                                  appTextStyle(
                                      weight: FONTWEIGHT.medium,
                                      type: "B1",
                                      color: Colors.white)),
                          style: TextButton.styleFrom(
                            backgroundColor: positiveButtonColor,
                            shape: positiveButtonRoundCorner ??
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                          ),
                          onPressed: positiveButtonCallBack ??
                              () {
                                Navigator.of(cTxt).pop();
                              },
                        ),
                      ),
                    ),

                  kHorizontalSpace(
                      width: negativeButtonText == null ? 20.0 : 10.0),
                ],
              ),
            kVerticalSpace(height: 20.0),
          ],
        ),
      ),
    ),
  );
}
