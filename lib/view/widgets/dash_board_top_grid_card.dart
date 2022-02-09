import 'package:flutter/material.dart';
import 'package:flutter_dashboard/contstants/size_config.dart';
import 'package:flutter_dashboard/contstants/style_data.dart';
import 'package:flutter_svg/svg.dart';

import '../../contstants/colors_data.dart';

class DashboardTopCard extends StatelessWidget {
  final String icon;
  final String title;
  final String subTitle;
  final Color startColors;
  final Color endColors;

  const DashboardTopCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.startColors,
    required this.endColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 15, vertical: SizeConfig.isDesktop() ? 20 : 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            startColors,
            endColors,
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            5,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: SizeConfig.isMobile()
                    ? 50
                    : SizeConfig.isTablet()
                        ? 50
                        : 70,
                width: SizeConfig.isMobile()
                    ? 50
                    : SizeConfig.isTablet()
                        ? 50
                        : 70,
                margin: const EdgeInsets.only(top: 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SizedBox(
                    width: 25,
                    height: 25,
                    child: SvgPicture.asset(
                      icon,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
              kWidthBox20,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontSize: SizeConfig.isDesktop() ? 25 : 16,
                          color: kWhiteColor,
                        ),
                  ),
                  Text(
                    subTitle,
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          color: kWhiteColor,
                          fontSize: SizeConfig.isDesktop() ? 14 : 12,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
