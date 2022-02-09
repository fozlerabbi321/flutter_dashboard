import 'package:flutter/material.dart';
import 'package:flutter_dashboard/contstants/size_config.dart';
import 'package:flutter_dashboard/contstants/style_data.dart';
import 'package:flutter_dashboard/models/response/rp_dash_board_list.dart';
import 'package:flutter_svg/svg.dart';

import '../../contstants/colors_data.dart';

class DashboardTopCard extends StatelessWidget {
  final RpDashboardTopList data;

  const DashboardTopCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 15, vertical: SizeConfig.isDesktop() ? 20 : 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            data.startColors,
            data.endColors,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
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
                      data.icon,
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
                    data.total,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontSize: SizeConfig.isDesktop() ? 25 : 16,
                          color: kWhiteColor,
                        ),
                  ),
                  Text(
                    data.subTitle,
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
