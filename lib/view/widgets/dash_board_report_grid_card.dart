import 'package:flutter/material.dart';
import 'package:flutter_dashboard/contstants/size_config.dart';
import 'package:flutter_dashboard/contstants/style_data.dart';
import 'package:flutter_dashboard/models/response/rp_dash_report_list.dart';

import '../../contstants/colors_data.dart';

class DashboardReportCard extends StatelessWidget {
  final RpDashReportList data;
  final double progress;
  const DashboardReportCard({
    Key? key,
    required this.data,
    this.progress = 0.0,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.title,
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: kWhiteColor,
                      fontSize: SizeConfig.isDesktop() ? 14 : 12,
                    ),
              ),
              Text(
                '+${data.percentage}%',
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: kWhiteColor,
                      fontSize: SizeConfig.isDesktop() ? 14 : 12,
                    ),
              ),
            ],
          ),
          Text(
            data.totalUser,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontSize: 17,
                  color: kWhiteColor,
                ),
          ),
          kHeightBox10,
          Text(
            '${data.totalTargetUser}K Target Users',
            style: Theme.of(context).textTheme.subtitle2?.copyWith(
                  color: kWhiteColor,
                  fontSize: SizeConfig.isDesktop() ? 12 : 10,
                ),
          ),
        ],
      ),
    );
  }
}
