import 'package:flutter/material.dart';
import 'package:flutter_dashboard/contstants/size_config.dart';
import 'package:flutter_dashboard/contstants/style_data.dart';
import 'package:flutter_dashboard/models/response/rp_dash_progress_list.dart';
import 'package:flutter_svg/svg.dart';

import '../../contstants/colors_data.dart';
import '../../contstants/images.dart';

class DashboardProgressCard extends StatelessWidget {
  final RpDashProgressList data;
  final double progress;
  const DashboardProgressCard({
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
                data.price,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      fontSize: 16,
                      color: kWhiteColor,
                    ),
              ),

              /*  Column(
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
              ),*/
              SizedBox(
                width: 20,
                child: SvgPicture.asset(
                  Images.cart,
                  color: kWhiteColor,
                  height: 20,
                ),
              ),
            ],
          ),
          kHeightBox10,
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: kBlackColor2,
              color: kWhiteColor,
              minHeight: 8,
            ),
          ),
          kHeightBox10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.subTitle,
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: kWhiteColor,
                      fontSize: SizeConfig.isDesktop() ? 14 : 12,
                    ),
              ),
              Text(
                '2.2%+',
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: kWhiteColor,
                      fontSize: SizeConfig.isDesktop() ? 14 : 12,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
