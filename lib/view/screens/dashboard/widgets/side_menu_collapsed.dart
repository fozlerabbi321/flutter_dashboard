import 'package:flutter/material.dart';
import 'package:flutter_dashboard/contstants/style_data.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../contstants/colors_data.dart';
import '../../../../contstants/size_config.dart';

class SideMenuCollapsed extends StatelessWidget {
  final String title;
  final String image;
  final bool isSelect;

  const SideMenuCollapsed({
    Key? key,
    required this.title,
    required this.image,
    this.isSelect = false,
  }) : super(key: key);

  Future showSubMenus(BuildContext context) async {
    await showMenu(
      context: context,
      color: const Color(0xFFe9f7f0),
      position: const RelativeRect.fromLTRB(50, 100, 100, 100),
      items: [
        PopupMenuItem(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              kHeightBox5,
              Container(
                color: kStUnderLineColor,
                height: 1,
              )
            ],
          ),
        ),
        PopupMenuItem(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: Text(
              "$title List",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ),
        PopupMenuItem(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: MouseRegion(
              onHover: (event) => showChildMenus(context),
              child: Text(
                "Add $title",
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future showChildMenus(BuildContext context) async {
    await showMenu(
      context: context,
      color: const Color(0xFFe9f7f0),
      position: const RelativeRect.fromLTRB(100, 100, 100, 100),
      items: [
        PopupMenuItem(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: Text(
              "$title List",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ),
        PopupMenuItem(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: Text(
              "Add $title",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => showSubMenus(context),
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Row(
          children: [
            const SizedBox(
              // color: const Color(0xFFAF126E),
              width: 3,
              height: 50,
            ),
            Container(
              height: 50,
              //width: width - 3.0,
              padding: EdgeInsets.only(
                  left: SizeConfig.isDesktop() ? 15 : 10,
                  right: SizeConfig.isDesktop() ? 15 : 10),
              child: SizedBox(
                width: 15,
                height: 15,
                child: SvgPicture.asset(
                  image,
                  color: kHintColor,
                  width: 15,
                  height: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
