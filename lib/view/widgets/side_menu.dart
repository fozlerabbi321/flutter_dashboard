import 'package:flutter/material.dart';
import 'package:flutter_dashboard/contstants/colors_data.dart';
import 'package:flutter_dashboard/contstants/size_config.dart';

import '../../contstants/style_data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: appBarHeight),
      height: SizeConfig.screenHeight,
      child: SafeArea(
        child: Container(
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
