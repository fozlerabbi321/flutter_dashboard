import 'package:flutter/material.dart';
import 'package:flutter_dashboard/contstants/colors_data.dart';
import 'package:flutter_dashboard/contstants/images.dart';

class RpDashboardTopList {
  final String icon;
  final String total;
  final String subTitle;
  final Color startColors;
  final Color endColors;

  RpDashboardTopList({
    this.icon = Images.about,
    this.subTitle = 'Customer',
    this.total = '8000',
    this.startColors = kPrimaryColor,
    this.endColors = kSecondaryColor,
  });
}

final List<RpDashboardTopList> rpTopList = [
  RpDashboardTopList(
    icon: Images.about,
    total: '4000',
    subTitle: 'Customer',
    startColors: const Color(0xFF286CD1),
    endColors: const Color(0xFF002698),
  ),
  RpDashboardTopList(
    icon: Images.about,
    total: '8000',
    subTitle: 'Product',
    startColors: const Color(0xFFED4C5C),
    endColors: const Color(0xFFC52231),
  ),
  RpDashboardTopList(
    icon: Images.about,
    total: '1000',
    subTitle: 'Supplier',
    startColors: const Color(0xFFF48020),
    endColors: const Color(0xFFF7913D),
  ),
  RpDashboardTopList(
    icon: Images.about,
    total: '1000',
    subTitle: 'Value of Sales',
    startColors: const Color(0xFF341EC0),
    endColors: const Color(0xFF4D3CBD),
  ),
  RpDashboardTopList(
    icon: Images.about,
    total: '35000',
    subTitle: 'Customer',
    startColors: const Color(0xFF4AC49F),
    endColors: const Color(0xFF4AC49F),
  ),
  RpDashboardTopList(
    icon: Images.about,
    total: '1000',
    subTitle: 'Product',
    startColors: const Color(0xFF616FC7),
    endColors: const Color(0xFF616FC7),
  ),
  RpDashboardTopList(
    icon: Images.about,
    total: '1000',
    subTitle: 'Supplier',
    startColors: const Color(0xFFF48020),
    endColors: const Color(0xFFF7913D),
  ),
  RpDashboardTopList(
    icon: Images.about,
    total: '1000',
    subTitle: 'Value of Sales',
    startColors: const Color(0xFF464646),
    endColors: const Color(0xFF464646),
  ),
];
