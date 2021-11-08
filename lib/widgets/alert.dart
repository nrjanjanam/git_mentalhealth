import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:git_mentalhealth/style/adaptive_text.dart';
import 'package:git_mentalhealth/style/centralize_strings.dart';
import 'package:git_mentalhealth/style/text.dart';
import 'package:git_mentalhealth/utils/assets_file.dart';
import 'package:git_mentalhealth/utils/color_constants.dart';
import 'package:git_mentalhealth/utils/size_config.dart';
import 'package:git_mentalhealth/widgets/button.dart';
import 'package:git_mentalhealth/widgets/spaces.dart';

class Alert {
  static Future<dynamic> showSuccessDialogWithImage(
      {@required BuildContext? context,
      @required String? message,
      TextStyle? messageStyle,
      Function? buttonCallback,
      String? imageIcon,
      bool? needNegativeButton = false,
      bool? needPositiveButton = false,
      Function? negativeButtonCallback,
      TextAlign? messageTextAlign = TextAlign.center,
      String? positiveButtonText,
      String? negativeButtonText,
      String? heading,
      TextStyle? headingStyle,
      bool? needExpandedButtons = false,
      bool? bluePositiveButton = false}) async {
    await showDialogWithImage(
      context: context!,
      icon: imageIcon == null
          ? Image.asset(
              imgSuccessIcon,
              height: const AdaptiveTextSize()
                  .getAdaptiveSize(Get.context!, 80, CentralizeString.L),
              width: const AdaptiveTextSize()
                  .getAdaptiveSize(Get.context!, 80, CentralizeString.L),
            )
          : SvgPicture.asset(
              imageIcon,
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? kAccentColor
                      : kAccentDarkColor,
              height: const AdaptiveTextSize()
                  .getAdaptiveSize(Get.context!, 80, CentralizeString.L),
              width: const AdaptiveTextSize()
                  .getAdaptiveSize(Get.context!, 80, CentralizeString.L),
            ),
      message: message,
      messageTextAlign: messageTextAlign,
      messageStyle: messageStyle ??
          appTextStyle(
            color: MediaQuery.of(context).platformBrightness == Brightness.light
                ? kAccentColor
                : kAccentDarkColor,
            weight: FONTWEIGHT.light,
          ),
      heading: heading ?? "",
      headingStyle: headingStyle ??
          appTextStyle(
            weight: FONTWEIGHT.bold,
            type: "B1",
          ),
      footer: Padding(
        padding: needExpandedButtons!
            ? const EdgeInsets.only(left: 20.0, right: 20.0)
            : EdgeInsets.zero,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (needNegativeButton!)
            if (needExpandedButtons)
              Expanded(
                child: UiButton(
                  buttonWidth: needExpandedButtons ? Get.width / 2 : 200,
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
                buttonWidth: needExpandedButtons ? Get.width / 2 : 200,
                backgroundColor: Colors.white,
                title: negativeButtonText ?? "Cancel",
                onPress: negativeButtonCallback ??
                    () {
                      Navigator.of(context, rootNavigator: true).pop('dialog');
                    },
                isRounded: true,
              ),
          kHorizontalSpace(width: needNegativeButton ? 20.0 : 0.0),
          if (needPositiveButton!)
            if (needExpandedButtons)
              Expanded(
                child: UiButton(
                  buttonWidth: needExpandedButtons ? Get.width / 2 : 200,
                  textColor: bluePositiveButton!
                      ? Colors.white
                      : MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? kPrimaryColor
                          : kPrimaryDarkColor,
                  backgroundColor: bluePositiveButton
                      ? MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? kPrimaryColor
                          : kPrimaryDarkColor
                      : Colors.white,
                  title: positiveButtonText ?? "OK",
                  onPress: buttonCallback ??
                      () {
                        Navigator.of(context, rootNavigator: true)
                            .pop('dialog');
                      },
                  isRounded: true,
                ),
              ),
          if (needPositiveButton)
            if (!needExpandedButtons)
              UiButton(
                buttonWidth: needExpandedButtons ? Get.width / 2 : 200,
                textColor: bluePositiveButton!
                    ? Colors.white
                    : MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? kPrimaryColor
                        : kPrimaryDarkColor,
                backgroundColor: bluePositiveButton
                    ? MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? kPrimaryColor
                        : kPrimaryDarkColor
                    : Colors.white,
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

Future<dynamic> showDialogWithImage(
    {@required BuildContext? context,
    @required Widget? icon,
    @required String? message,
    TextStyle? messageStyle,
    TextAlign? messageTextAlign,
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
    bool? barrierDismissible = false,
    GestureTapCallback? negativeButtonCallBack,
    Widget? footer}) async {
  if (SizeConfig.devicetype == DEVICETYPE.desktop) {
    await showGeneralDialog(
        context: context!,
        barrierDismissible: barrierDismissible!,
        pageBuilder: (cTxt, ani1, ani2) => SingleChildScrollView(
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.25,
                      vertical: Get.height * 0.25),
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20, top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: kGrey05,
                    shape: BoxShape.rectangle,
                    boxShadow: const [BoxShadow(color: kGrey20)],
                    borderRadius: BorderRadius.circular(8),
                  ),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      heading,
                                      textScaleFactor: 1.0,
                                      textAlign:
                                          messageTextAlign ?? TextAlign.center,
                                      style: headingStyle ??
                                          appTextStyle(
                                            weight: FONTWEIGHT.bold,
                                            type: "B1",
                                          ),
                                    ),
                                  ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    message!,
                                    textScaleFactor: 1.0,
                                    textAlign:
                                        messageTextAlign ?? TextAlign.center,
                                    style: messageStyle ??
                                        appTextStyle(
                                          weight: FONTWEIGHT.light,
                                          color: MediaQuery.of(context)
                                                      .platformBrightness ==
                                                  Brightness.light
                                              ? kAccentColor
                                              : kAccentDarkColor,
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
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                side: const BorderSide(
                                                    color: kPrimaryColor))),
                                    onPressed: negativeButtonCallBack ??
                                        () {
                                          Navigator.of(cTxt).pop();
                                        },
                                  ),
                                ),
                              ),

                            SizedBox(
                                width: negativeButtonText != null ? 10 : 20),
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
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                width:
                                    negativeButtonText == null ? 20.0 : 10.0),
                          ],
                        ),
                      kVerticalSpace(height: 20.0),
                    ],
                  ),
                ),
              ),
            ));
  } else {
    await showDialog(
      context: context!,
      barrierDismissible: barrierDismissible!,
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
                                  color: MediaQuery.of(context)
                                              .platformBrightness ==
                                          Brightness.light
                                      ? kAccentColor
                                      : kAccentDarkColor,
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
                            child: Text(
                              positiveButtonText,
                              textScaleFactor: 1.0,
                              style: positiveButtonStyle ??
                                  appTextStyle(
                                      weight: FONTWEIGHT.medium,
                                      type: "B1",
                                      color: MediaQuery.of(context)
                                                  .platformBrightness ==
                                              Brightness.light
                                          ? kAccentColor
                                          : kAccentDarkColor),
                            ),
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
}
