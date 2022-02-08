import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/theme_controller.dart';
import 'contstants/theme/dark_theme.dart';
import 'contstants/theme/light_theme.dart';
import 'services/get_di.dart';
import 'services/localization_services.dart';
import 'view/screens/dashboard_screen.dart';

late SharedPreferences prefs;
late SharedPreferences intro;

Future<void> main() async {
  //init flutter binding
  WidgetsFlutterBinding.ensureInitialized();
  //init get storage
  await GetStorage.init();
  //Single ton
  await init();
  //Init my app ,,,
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        return GetMaterialApp(
          title: 'Flutter Dashboard',
          debugShowCheckedModeBanner: false,
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
            },
          ),
          theme: themeController.darkTheme ? dark : light,
          translations: LocalizationService(),
          // your translations
          locale: LocalizationService().getCurrentLocale(),
          // translations will be displayed in that locale
          fallbackLocale: const Locale(
            'en',
            'US',
          ),
          home: const DashboardScreen(),
          defaultTransition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 200), // default: 300
        );
      },
    );
  }
}
