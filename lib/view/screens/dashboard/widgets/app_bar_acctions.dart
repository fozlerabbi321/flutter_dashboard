import 'package:flutter/material.dart';
import 'package:flutter_dashboard/contstants/colors_data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../controllers/dashboard_controller.dart';
import '../../../../contstants/images.dart';
import '../../../../contstants/style_data.dart';
import '../../../widgets/language_pupup.dart';

class AppBarActions extends StatelessWidget {
  final DashboardController dashboardController;

  const AppBarActions({Key? key, required this.dashboardController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'English',
            style: Theme.of(context).textTheme.subtitle2?.copyWith(
                  color: kHintColor,
                  height: 1.0,
                ),
          ),
          LanguagePopup(),
          kWidthBox5,
          SizedBox(
            width: 20,
            child: Icon(
              Icons.search_outlined,
              color: Get.isDarkMode ? kWhiteColor : kHintColor,
            ),
          ),
          kWidthBox5,
          SizedBox(
            width: 20,
            child: SvgPicture.asset(
              Images.notification,
              color: Get.isDarkMode ? kWhiteColor : kHintColor,
              height: 20,
            ),
          ),
          kWidthBox5,
          SizedBox(
            width: 20,
            child: SvgPicture.asset(
              Images.cart,
              color: Get.isDarkMode ? kWhiteColor : kHintColor,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}
