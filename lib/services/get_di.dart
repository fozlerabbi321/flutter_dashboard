import 'package:flutter_dashboard/services/repository/home_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/dashboard_controller.dart';
import '../controllers/theme_controller.dart';
import '../main.dart';

Future<void> init() async {
  /// Core
  prefs = await SharedPreferences.getInstance();
  Get.lazyPut(
    () => prefs,
  );

  ///Repository
  Get.lazyPut(() => HomeRepo(), fenix: true);

  /// theme Controller
  Get.lazyPut(
    () => ThemeController(),
    fenix: true,
  );
  Get.lazyPut(
    () => DashboardController(
      homeRepo: Get.find(),
    ),
    fenix: true,
  );
}
