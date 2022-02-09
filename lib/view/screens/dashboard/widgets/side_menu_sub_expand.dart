import 'package:flutter/material.dart';
import 'package:flutter_dashboard/contstants/colors_data.dart';
import 'package:flutter_dashboard/contstants/style_data.dart';
import 'package:flutter_dashboard/view/screens/dashboard/widgets/side_menu_child_expand.dart';
import 'package:get/get.dart';

import '../../../../contstants/size_config.dart';

class SideMenuSubExpand extends StatelessWidget {
  final double width;
  final String title;
  final bool isSelect;
  final Function? onTap;

  const SideMenuSubExpand(
      {Key? key,
      this.width = 200,
      required this.title,
      this.isSelect = false,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 2,
            ),
            Container(
              color: kHintColor,
              width: 12,
              height: 1,
            ),
            kWidthBox5,
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    color:
                        isSelect ? const Color(0xFFAF126E) : kStUnderLineColor,
                    fontSize: 14,
                  ),
            ),
          ],
        ),
        Container(
          child: isSelect
              ? Container(
                  width: width - (SizeConfig.isDesktop() ? 23 : 13),
                  margin: EdgeInsets.only(
                    left: SizeConfig.isDesktop() ? 20 : 10,
                    top: 5,
                    bottom: 0,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    border: const Border(
                      left: BorderSide(color: kStUnderLineColor, width: 1),
                    ),
                  ),
                  child: ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return SideMenuChildExpand(
                          title: 'Child cat'.tr,
                        );
                      }),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
