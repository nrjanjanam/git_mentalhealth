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
import 'package:git_mentalhealth/widgets/alert.dart';
import 'package:git_mentalhealth/widgets/stateful_wrapper.dart';

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
              .then((value) => Get.offAllNamed(AppRouteConstants.homePage));
          // Check for Already Logged In User
          // TODO: check logic for this
        }
      },
      child: const Scaffold(
        body: SplashView(),
        // listeners: [
        //   BlocListener<AuthBloc, AuthState>(
        //     listener: (context, state) {
        //       state.map(
        //         (_) {
        //           Get.offAllNamed(AppRoutes.login);
        //           // ExtendedNavigator.of(context).replace(Routes.loginPage);
        //         },
        //         authenticated: (value) {
        //           BlocProvider.of<PreloadConfigCubit>(context)
        //               .fetchPreLoadConfig();
        //         },
        //         unauthenticated: (_) {
        //           Get.offAllNamed(AppRoutes.login);
        //           // ExtendedNavigator.of(context).replace(Routes.loginPage);
        //         },
        //       );
        //     },
        //   ),
        //   BlocListener<PreloadConfigCubit, PreloadConfigState>(
        //   listener: (context, state) {
        //     if (state is PreloadConfigSuccess) {
        //       PreloadServices.callPreLoadServices(state.preLoadConfig);
        //     }

        //     if (state is PreloadConfigError) {
        //       Get.find<LocalAuthController>()
        //           .verifyUserViaPhoneAuthentication();
        //       // Get.offAllNamed(AppRoutes.home);
        //       // ExtendedNavigator.of(context).replace(Routes.homePage);
        //     }
        //   },
        // ),
        // BlocListener<HomeCubit, HomeState>(
        //   listener: (context, state) {
        //     if (state is HomeSuccess) {
        //       Get.find<LocalAuthController>()
        //           .verifyUserViaPhoneAuthentication();
        //       //Get.offAllNamed(AppRoutes.home);
        //       // ExtendedNavigator.of(context).replace(Routes.homePage);
        //     }

        //     if (state is HomeError) {
        //       Get.offAllNamed(AppRoutes.login);
        //       // ExtendedNavigator.of(context).replace(Routes.loginPage);
        //     }
        //   },
        // )
        // ],
        // ),
      ),
    );
  }
}
