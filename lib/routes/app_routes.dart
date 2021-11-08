import 'package:get/get.dart';
import 'package:git_mentalhealth/pages/homepage/homepage.dart';
import 'package:git_mentalhealth/pages/spash/presentation/spash_page.dart';

part 'app_route_constants.dart';

class AppPages {
  static final List<GetPage> allRoutes = [
    GetPage(name: AppRouteConstants.splashPage, page: () => SplashPage()),
    GetPage(name: AppRouteConstants.homePage, page: () => const MyHomePage()),
  ];
}
