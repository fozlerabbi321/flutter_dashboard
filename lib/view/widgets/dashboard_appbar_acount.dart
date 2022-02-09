import 'package:flutter/material.dart';
import 'package:flutter_dashboard/contstants/colors_data.dart';
import 'package:get/get.dart';

import '../../contstants/images.dart';
import '../../contstants/style_data.dart';

class DashBoardAppBarAccount extends StatelessWidget {
  const DashBoardAppBarAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: Container(
            alignment: Alignment.centerLeft,
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(top: 0),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  Images.testUser,
                ),
              ),
            ),
          ),
        ),
        kWidthBox10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fozle Rabbi',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              'Admin',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ],
    );
    /*return PopupMenuButton(
      // padding: const EdgeInsets.only(top: 50),
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
      child: Row(
        children: [
          SizedBox(
            child: Container(
              alignment: Alignment.centerLeft,
              height: 40,
              width: 40,
              margin: const EdgeInsets.only(top: 0),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    Images.testUser,
                  ),
                ),
              ),
            ),
          ),
          kWidthBox10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fozle Rabbi',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                'Admin',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ],
      ),
      onSelected: (value) {},
    );*/
  }

  void showPopupMenu(BuildContext context) async {
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 100, 50, 0),
      items: [
        const PopupMenuItem<String>(child: Text('Doge'), value: 'Doge'),
        PopupMenuItem(
          value: 'all',
          child: Text('all'.tr),
          textStyle: Theme.of(context).textTheme.subtitle2?.copyWith(
                color: kPrimaryColor,
              ),
        ),
      ],
      elevation: 8.0,
    );
  }
}
