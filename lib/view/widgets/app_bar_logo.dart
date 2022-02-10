import 'package:flutter/material.dart';

import '../../contstants/colors_data.dart';
import '../../contstants/images.dart';
import '../../contstants/style_data.dart';

class AppBarLogo extends StatelessWidget {
  final bool isMenuClick;
  const AppBarLogo({Key? key, this.isMenuClick = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: Image.asset(
            Images.homeLogo,
          ),
        ),
        if (isMenuClick) kWidthBox5,
        if (isMenuClick)
          Text(
            'AmarSolution',
            style: Theme.of(context).textTheme.headline2?.copyWith(
                  color: kPrimaryColor,
                ),
          ),
      ],
    );
  }
}
