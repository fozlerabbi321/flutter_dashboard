import 'package:flutter/material.dart';
import 'package:flutter_dashboard/controllers/dashboard_controller.dart';
import 'package:flutter_dashboard/contstants/colors_data.dart';
import 'package:flutter_dashboard/contstants/images.dart';
import 'package:flutter_dashboard/contstants/size_config.dart';
import 'package:flutter_dashboard/contstants/style_data.dart';
import 'package:flutter_dashboard/models/response/rp_dash_board_list.dart';
import 'package:flutter_dashboard/models/response/rp_dash_progress_list.dart';
import 'package:flutter_dashboard/models/response/rp_dash_report_list.dart';
import 'package:flutter_dashboard/view/screens/dashboard/widgets/app_bar_acctions.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../widgets/app_bar_logo.dart';
import '../../widgets/dash_board_progress_grid_card.dart';
import '../../widgets/dash_board_report_grid_card.dart';
import '../../widgets/dash_board_top_grid_card.dart';
import '../../widgets/dashboard_appbar_acount.dart';
import '../../widgets/side_menu.dart';
import '../../widgets/text_image_widget.dart';
import 'widgets/app_bar_services.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller!)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller?.repeat();
  }

  @override
  void dispose() {
    controller?.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<DashboardController>(builder: (dashBoardController) {
      return Scaffold(
        key: _scaffoldKey,
        drawer: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 200),
          child: SideMenu(
            dashboardController: dashBoardController,
            width: 200,
          ),
        ),
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          leadingWidth: 0,
          leading: Container(),
          title: Row(
            children: [
              Row(
                children: [
                  if (SizeConfig.isDesktop())
                    AppBarLogo(
                      isMenuClick: SizeConfig.isMobile()
                          ? false
                          : dashBoardController.isMenu,
                    ),
                  IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: kPrimaryColor,
                    ),
                    onPressed: () {
                      if (!SizeConfig.isDesktop()) {
                        _scaffoldKey.currentState?.openDrawer();
                      } else {
                        dashBoardController.updateMenu();
                      }
                    },
                  ),
                ],
              ),
              Expanded(
                child: Stack(
                  children: [
                    if (SizeConfig.isDesktop())
                      Center(
                        child: AppBarServices(
                          dashboardController: dashBoardController,
                        ),
                      ),
                    if (!SizeConfig.isMobile())
                      AppBarActions(
                        dashboardController: dashBoardController,
                      ),
                    if (SizeConfig.isMobile())
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kPrimaryColor,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        height: 38,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                              child: Icon(
                                Icons.search_outlined,
                                color:
                                    Get.isDarkMode ? kWhiteColor : kHintColor,
                              ),
                            ),
                            kWidthBox15,
                            Text(
                              'Search...'.tr,
                              style: kRegularText2.copyWith(
                                color: kOrdinaryColor,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              InkWell(
                  onTap: () {
                    Get.find<DashboardController>().updateAccountPopup();
                  },
                  child: const DashBoardAppBarAccount()),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: kPrimaryColor,
              ),
              onPressed: () {
                Get.find<DashboardController>().updateAccountMenuPopup();
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizeConfig.isDesktop()
                      ? SideMenu(
                          dashboardController: dashBoardController,
                          width: dashBoardController.isMenu ? 200 : null,
                        )
                      : const SizedBox(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.isMobile() ? 10 : 20,
                            vertical: 15),
                        child: Column(
                          children: [
                            MasonryGridView.count(
                              crossAxisCount: SizeConfig.isMobile()
                                  ? SizeConfig.screenWidth > 600
                                      ? 2
                                      : 1 // size < 600 or || size < 768
                                  : 4,
                              mainAxisSpacing: SizeConfig.isMobile() ? 20 : 20,
                              crossAxisSpacing: SizeConfig.isMobile() ? 20 : 20,
                              itemCount: rpTopList.length,
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {},
                                  child:
                                      DashboardTopCard(data: rpTopList[index]),
                                );
                              },
                            ),
                            kHeightBox15,
                            MasonryGridView.count(
                              crossAxisCount: SizeConfig.isMobile()
                                  ? SizeConfig.screenWidth > 600
                                      ? 2
                                      : 1 // size < 600 or || size < 768
                                  : 4,
                              mainAxisSpacing: SizeConfig.isMobile() ? 20 : 20,
                              crossAxisSpacing: SizeConfig.isMobile() ? 20 : 20,
                              itemCount: rpProgressList.length,
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {},
                                  child: DashboardProgressCard(
                                    data: rpProgressList[index],
                                    progress: 0.6 + index.toDouble() / 100,
                                  ),
                                );
                              },
                            ),
                            kHeightBox15,
                            MasonryGridView.count(
                              crossAxisCount: SizeConfig.isMobile()
                                  ? SizeConfig.screenWidth > 600
                                      ? 2
                                      : 1 // size < 600 or || size < 768
                                  : 4,
                              mainAxisSpacing: SizeConfig.isMobile() ? 20 : 20,
                              crossAxisSpacing: SizeConfig.isMobile() ? 20 : 20,
                              itemCount: rpReportList.length,
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {},
                                  child: DashboardReportCard(
                                    data: rpReportList[index],
                                    progress: 0.6 + index.toDouble() / 100,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: dashBoardController.isAccountPopup
                    ? Positioned(
                        top: 0,
                        right: 20,
                        child: AnimatedContainer(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            boxShadow: [
                              kOrdinaryShadow,
                            ],
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(
                                2,
                              ),
                              bottomRight: Radius.circular(
                                2,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.all(15),
                          duration: const Duration(milliseconds: 5000),
                          curve: Curves.bounceInOut,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextImageWidgets(
                                image: Images.account,
                                title: 'Edit Profile'.tr,
                                isSelect: true,
                              ),
                              kHeightBox25,
                              TextImageWidgets(
                                image: Images.account,
                                title: 'Notification'.tr,
                                isSelect: true,
                              ),
                              kHeightBox25,
                              TextImageWidgets(
                                image: Images.account,
                                title: 'Change Password'.tr,
                                isSelect: true,
                              ),
                              kHeightBox25,
                              TextImageWidgets(
                                image: Images.account,
                                title: 'Logout'.tr,
                                isSelect: true,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(
                        child: dashBoardController.isMenuPopup
                            ? Positioned(
                                top: 0,
                                right: 0,
                                child: AnimatedContainer(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    boxShadow: [
                                      kOrdinaryShadow,
                                    ],
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(
                                        2,
                                      ),
                                      bottomRight: Radius.circular(
                                        2,
                                      ),
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(15),
                                  duration: const Duration(milliseconds: 5000),
                                  curve: Curves.bounceInOut,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextImageWidgets(
                                        image: Images.account,
                                        title: 'Customer Receipt'.tr,
                                        isSelect: true,
                                      ),
                                      kHeightBox25,
                                      TextImageWidgets(
                                        image: Images.account,
                                        title: 'Supplier Payment'.tr,
                                        isSelect: true,
                                      ),
                                      kHeightBox25,
                                      TextImageWidgets(
                                        image: Images.account,
                                        title: 'Today\'s Summery'.tr,
                                        isSelect: true,
                                      ),
                                      kHeightBox25,
                                      TextImageWidgets(
                                        image: Images.account,
                                        title: 'Return Order'.tr,
                                        isSelect: true,
                                      ),
                                      kHeightBox25,
                                      TextImageWidgets(
                                        image: Images.account,
                                        title: 'POS'.tr,
                                        isSelect: true,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
