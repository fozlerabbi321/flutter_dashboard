import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../contstants/colors_data.dart';

class TextPopupMenu extends StatelessWidget {
  const TextPopupMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 'all',
            child: Text('all'.tr),
            textStyle: Theme.of(context).textTheme.subtitle2?.copyWith(
                  color: kPrimaryColor,
                ),
          ),
          PopupMenuItem(
            value: 'all',
            child: Text('Text'.tr),
            textStyle: Theme.of(context).textTheme.subtitle2?.copyWith(
                  color: kPrimaryColor,
                ),
          ),
        ];
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      onSelected: (value) {},
      child: const Icon(Icons.access_time_filled),
    );
  }
}
