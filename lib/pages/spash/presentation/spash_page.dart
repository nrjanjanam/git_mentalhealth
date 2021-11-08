import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:get/get.dart';
import 'package:git_mentalhealth/pages/homepage/homepage.dart';
import 'package:git_mentalhealth/pages/spash/presentation/preload_services.dart';
import 'package:git_mentalhealth/pages/spash/presentation/splash_view.dart';
import 'package:git_mentalhealth/utils/assets_file.dart';
import 'package:git_mentalhealth/utils/size_config.dart';
import 'package:git_mentalhealth/widgets/alert.dart';
import 'package:git_mentalhealth/widgets/stateful_wrapper.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);
  final Future<bool> waitSomeTime =
      Future.delayed(const Duration(seconds: 5)).then((value) => false);

  @override
  Widget build(BuildContext context) {
    PreloadServices.init(context);
    SizeConfig.init(context);
    return StatefulWrapper(
      onInit: () async {
        // Check Jailbreak / Rooted
        bool jailbroken = await FlutterJailbreakDetection.jailbroken;
        // jailbroken = false;
        if (jailbroken) {
          Alert.showSuccessDialogWithImage(
            imageIcon: icInfo,
            context: Get.context,
            message:
                "This application doesn't allow to run on jailbreak or rooted device. Kindly make necessary changes and try again!",
            buttonCallback: () {
              Get.back();
              if (GetPlatform.isAndroid) {
                SystemNavigator.pop();
              } else if (GetPlatform.isIOS) {
                Get.back();
              }
            },
          );
        } else {
          // Check for Already Logged In User
          // TODO: check logic for this
        }
      },
      child: Scaffold(
        body: FutureBuilder(
          future: waitSomeTime,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const MyHomePage();
            } else {
              return const SplashView();
            }
          },
        ),
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
