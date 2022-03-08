import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../contstants/colors_data.dart';

class LanguagePopup extends StatelessWidget {
  const LanguagePopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 'all',
            child: Text('Bangla'.tr),
            textStyle: Theme.of(context).textTheme.subtitle2?.copyWith(
                  color: kPrimaryColor,
                ),
          ),
          PopupMenuItem(
            value: 'all',
            child: Text('English'.tr),
            textStyle: Theme.of(context).textTheme.subtitle2?.copyWith(
                  color: kPrimaryColor,
                ),
          ),
        ];
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      onSelected: (value) {},
      child: Icon(
        Icons.arrow_drop_down,
        color: Get.isDarkMode ? kWhiteColor : kHintColor,
      ),
    );
  }
}
