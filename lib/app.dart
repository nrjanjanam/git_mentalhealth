import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:git_mentalhealth/routes/app_routes.dart';
import 'package:git_mentalhealth/utils/themes.dart';

class MyAppCore extends StatelessWidget {
  const MyAppCore({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'IN'),
        Locale('en', 'US'),
      ],
      title: 'GIT Mental Health Hackathon',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      enableLog: true,
      initialRoute: AppRouteConstants.splashPage,
      getPages: AppPages.allRoutes,
    );
  }
}
