import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/theme_controller.dart';
import '../main.dart';

Future<void> init() async {
  /// Core
  prefs = await SharedPreferences.getInstance();
  Get.lazyPut(
    () => prefs,
  );
  /* Get.lazyPut(() => ApiClient(), fenix: true);*/

  /// theme Controller
  Get.lazyPut(
    () => ThemeController(),
    fenix: true,
  );
}
