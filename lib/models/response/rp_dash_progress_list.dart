import 'package:flutter/material.dart';
import 'package:flutter_dashboard/contstants/colors_data.dart';
import 'package:flutter_dashboard/contstants/strings.dart';

class RpDashProgressList {
  final String price;
  final String totalPercentage;
  final String subTitle;
  final Color startColors;
  final Color endColors;

  RpDashProgressList({
    this.price = '500',
    this.totalPercentage = '8.2',
    this.subTitle = '8.2',
    this.startColors = kPrimaryColor,
    this.endColors = kSecondaryColor,
  });
}

final List<RpDashProgressList> rpProgressList = [
  RpDashProgressList(
    price: '5600',
    totalPercentage: '9.2',
    subTitle: 'Total Order',
    startColors: const Color(0xFFED4C5C),
    endColors: const Color(0xFFC52231),
  ),
  RpDashProgressList(
    price: '${kCurrency}4000',
    totalPercentage: '8.2',
    subTitle: 'Total Revenue',
    startColors: const Color(0xFFF48020),
    endColors: const Color(0xFFF7913D),
  ),
  RpDashProgressList(
    price: '574500',
    totalPercentage: '2.2',
    subTitle: 'Visitors',
    startColors: const Color(0xFF341EC0),
    endColors: const Color(0xFF4D3CBD),
  ),
  RpDashProgressList(
    price: '2457',
    totalPercentage: '3.2',
    subTitle: 'Messages',
    startColors: const Color(0xFF4AC49F),
    endColors: const Color(0xFF4AC49F),
  ),
];
