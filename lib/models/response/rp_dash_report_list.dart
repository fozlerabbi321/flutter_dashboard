import 'package:flutter/material.dart';
import 'package:flutter_dashboard/contstants/colors_data.dart';

class RpDashReportList {
  final String title;
  final String percentage;
  final String totalUser;
  final String totalTargetUser;
  final Color startColors;
  final Color endColors;

  RpDashReportList({
    this.title = '500',
    this.percentage = '8.2',
    this.totalUser = '8.2',
    this.totalTargetUser = '8.2',
    this.startColors = kPrimaryColor,
    this.endColors = kSecondaryColor,
  });
}

final List<RpDashReportList> rpReportList = [
  RpDashReportList(
    title: 'Visitors',
    percentage: '18',
    totalUser: '14.6K',
    totalTargetUser: '281.55',
    startColors: const Color(0xFFF48020),
    endColors: const Color(0xFFF7913D),
  ),
  RpDashReportList(
    title: 'Bounce Rate',
    percentage: '17',
    totalUser: '18.6%',
    totalTargetUser: '667.55',
    startColors: const Color(0xFFED4C5C),
    endColors: const Color(0xFFC52231),
  ),
  RpDashReportList(
    title: 'Users',
    percentage: '17',
    totalUser: '19.6M',
    totalTargetUser: '255.55',
    startColors: const Color(0xFF4AC49F),
    endColors: const Color(0xFF4AC49F),
  ),
  RpDashReportList(
    title: 'New Contacts',
    percentage: '17',
    totalUser: '85',
    totalTargetUser: '365.55',
    startColors: const Color(0xFF341EC0),
    endColors: const Color(0xFF4D3CBD),
  ),
];
