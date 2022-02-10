import 'package:flutter/material.dart';
import 'package:flutter_dashboard/controllers/dashboard_controller.dart';
import 'package:flutter_dashboard/contstants/colors_data.dart';
import 'package:flutter_dashboard/contstants/images.dart';
import 'package:flutter_dashboard/contstants/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../contstants/style_data.dart';
import '../screens/dashboard/widgets/side_menu_collapsed.dart';
import '../screens/dashboard/widgets/side_menu_expand_card.dart';
import 'app_bar_logo.dart';
import 'text_image_widget.dart';

class SideMenu extends StatelessWidget {
  final double? width;
  final DashboardController dashboardController;

  const SideMenu({Key? key, this.width, required this.dashboardController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      margin: EdgeInsets.only(top: SizeConfig.isDesktop() ? 0 : appBarHeight),
      height: SizeConfig.screenHeight,
      child: SafeArea(
        child: dashboardController.isMenu == false
            ? Column(
                children: [
                  Row(
                    children: [
                      Container(
                        color: const Color(0xFFAF126E),
                        width: 3,
                        height: 50,
                      ),
                      Container(
                        height: 50,
                        //width: width - 3.0,
                        padding: EdgeInsets.only(
                            left: SizeConfig.isDesktop() ? 15 : 10,
                            right: SizeConfig.isDesktop() ? 15 : 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFe9f7f0),
                          boxShadow: [
                            kOrdinaryShadow,
                          ],
                        ),
                        child: SizedBox(
                          width: 15,
                          height: 15,
                          child: SvgPicture.asset(
                            Images.home,
                            color: const Color(0xFFAF126E),
                            width: 15,
                            height: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SideMenuCollapsed(
                    title: 'Supplier'.tr,
                    image: Images.trams,
                  ),
                  SideMenuCollapsed(
                    title: 'Product'.tr,
                    image: Images.location,
                  ),
                ],
              )
            : Column(
                children: [
                  if (SizeConfig.isMobile()) kHeightBox10,
                  if (SizeConfig.isMobile())
                    const AppBarLogo(
                      isMenuClick: true,
                    ),
                  if (SizeConfig.isMobile()) kHeightBox10,
                  Row(
                    children: [
                      Container(
                        color: const Color(0xFFAF126E),
                        width: 3,
                        height: 50,
                      ),
                      Container(
                        height: 50,
                        width: width! - 3.0,
                        padding: EdgeInsets.only(
                          left: SizeConfig.isDesktop() ? 15 : 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFe9f7f0),
                          boxShadow: [
                            kOrdinaryShadow,
                          ],
                        ),
                        child: TextImageWidgets(
                          title: 'Dashboard'.tr,
                          image: Images.home,
                          color: const Color(0xFFAF126E),
                          isSelect: true,
                          space: SizeConfig.isDesktop() ? 15 : 10,
                        ),
                      ),
                    ],
                  ),
                  kHeightBox5,
                  SideMenuExpandCard(
                    title: 'Supplier'.tr,
                    image: dashboardController.isExpand
                        ? Images.dropDown
                        : Images.rightArrow,
                    isSelect: dashboardController.isExpand,
                    onTap: () {
                      dashboardController.updateIsExpand();
                    },
                  ),
                  kHeightBox5,
                  SideMenuExpandCard(
                    title: 'Product'.tr,
                    image: dashboardController.isExpand2
                        ? Images.dropDown
                        : Images.rightArrow,
                    isSelect: dashboardController.isExpand2,
                    onTap: () {
                      dashboardController.updateIsExpand2();
                    },
                  )
                ],
              ),
      ),
    );
  }
}
