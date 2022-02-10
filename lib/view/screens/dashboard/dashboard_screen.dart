import 'package:flutter/material.dart';
import 'package:flutter_dashboard/controllers/dashboard_controller.dart';
import 'package:flutter_dashboard/contstants/colors_data.dart';
import 'package:flutter_dashboard/contstants/images.dart';
import 'package:flutter_dashboard/contstants/size_config.dart';
import 'package:flutter_dashboard/contstants/style_data.dart';
import 'package:flutter_dashboard/models/response/rp_dash_board_list.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../widgets/app_bar_logo.dart';
import '../../widgets/dash_board_top_grid_card.dart';
import '../../widgets/dashboard_appbar_acount.dart';
import '../../widgets/side_menu.dart';
import '../../widgets/text_image_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                child: Container(),
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.isMobile() ? 10 : 20),
                      child: MasonryGridView.count(
                        crossAxisCount: SizeConfig.isMobile() ? 1 : 4,
                        mainAxisSpacing: SizeConfig.isMobile() ? 20 : 20,
                        crossAxisSpacing: SizeConfig.isMobile() ? 20 : 20,
                        itemCount: rpTopList.length,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {},
                            child: DashboardTopCard(data: rpTopList[index]),
                          );
                        },
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
                                        title: 'Customer Recive'.tr,
                                        isSelect: true,
                                      ),
                                      kHeightBox25,
                                      TextImageWidgets(
                                        image: Images.account,
                                        title: 'Supplier payment'.tr,
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
              /* Container(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextImageWidgets(
                                  image: Images.account,
                                  title: 'Customer Recive'.tr,
                                  isSelect: true,
                                ),
                                kHeightBox25,
                                TextImageWidgets(
                                  image: Images.account,
                                  title: 'Supplier payment'.tr,
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
                ),*/
            ],
          ),
        ),
      );
    });
  }
}
