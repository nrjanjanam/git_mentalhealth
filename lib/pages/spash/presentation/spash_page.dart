import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:get/get.dart';
import 'package:git_mentalhealth/pages/spash/domain/preload_services.dart';
import 'package:git_mentalhealth/pages/spash/presentation/splash_view.dart';
import 'package:git_mentalhealth/routes/app_routes.dart';
import 'package:git_mentalhealth/utils/assets_file.dart';
import 'package:git_mentalhealth/utils/size_config.dart';
import 'package:git_mentalhealth/common/widgets/alert.dart';
import 'package:git_mentalhealth/common/widgets/stateful_wrapper.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreloadServices.init(context);
    SizeConfig.init(context);
    return StatefulWrapper(
      onInit: () async {
        // Check Jailbreak / Rooted
        bool? _jailbroken;
        try {
          _jailbroken = await FlutterJailbreakDetection.jailbroken;
        } on PlatformException {
          _jailbroken = true;
        } on Exception catch (e) {
          _jailbroken = false;
          debugPrint(e.toString());
        }
        _jailbroken = false;
        if (_jailbroken) {
          try {
            await Alert.showSuccessDialogWithImage(
              imageIcon: icInfo,
              context: context,
              needPositiveButton: false,
              message:
                  "This application doesn't allow to run on jailbroken or rooted devices. Kindly check!",
              buttonCallback: () {
                if (GetPlatform.isAndroid) {
                  Get.back();
                  SystemNavigator.pop();
                } else if (GetPlatform.isIOS) {
                  Get.back();
                  Get.back();
                }
              },
            );
          } catch (e, trace) {
            debugPrint('$e $trace');
          }
        } else {
          Future.delayed(const Duration(seconds: 5))
              .then((value) => Get.offAllNamed(AppRouteConstants.launchPage));
        }
      },
      child: const Scaffold(
        body: SplashView(),
      ),
    );
  }
}
