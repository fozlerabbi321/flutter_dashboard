import 'package:flutter/material.dart';
import 'package:flutter_dashboard/controllers/dashboard_controller.dart';
import 'package:flutter_dashboard/contstants/colors_data.dart';
import 'package:flutter_dashboard/contstants/images.dart';
import 'package:flutter_dashboard/contstants/size_config.dart';
import 'package:flutter_dashboard/contstants/style_data.dart';
import 'package:get/get.dart';

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
    return Scaffold(
      key: _scaffoldKey,
      drawer: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 200),
        child: const SideMenu(),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: kPrimaryColor,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Row(
          children: [
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
      body: GetBuilder<DashboardController>(
        builder: (dashBoardController) {
          return SafeArea(
            child: Stack(
              children: [
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
                                    duration:
                                        const Duration(milliseconds: 5000),
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
          );
        },
      ),
    );
  }
}
