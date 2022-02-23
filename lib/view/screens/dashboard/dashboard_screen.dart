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

import '../../../models/response/dev_carts.dart';
import '../../widgets/app_bar_logo.dart';
import '../../widgets/dash_board_progress_grid_card.dart';
import '../../widgets/dash_board_report_grid_card.dart';
import '../../widgets/dash_board_top_grid_card.dart';
import '../../widgets/dashboard_appbar_acount.dart';
import '../../widgets/side_menu.dart';
import '../../widgets/text_image_widget.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'components/dashboard_chart.dart';
import 'components/earning_this_month.dart';
import 'components/expense_ratio.dart';
import 'components/top_selling_product_by_price.dart';
import 'widgets/app_bar_services.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<charts.Series<dynamic, String>> _seriesPieData = [];

  _generateData() {
    var pieData = [
      Task(
        'Work',
        35.0,
        const Color(0xFF3366cc),
      ),
      Task(
        'Eat',
        8.3,
        const Color(0xFF3366cc),
      ),
      Task(
        'Commute',
        10.8,
        const Color(0xFF3366cc),
      ),
      Task(
        'Tv',
        15.6,
        const Color(0xFF3366cc),
      ),
      Task(
        'Sleep',
        19.2,
        const Color(0xFF3366cc),
      ),
      Task(
        'Other',
        10.3,
        const Color(0xFF3366cc),
      ),
    ];
    _seriesPieData.add(
      charts.Series(
        data: pieData,
        domainFn: (dynamic task, _) => task.task,
        measureFn: (dynamic task, _) => task.taskValue,
        colorFn: (dynamic task, _) =>
            charts.ColorUtil.fromDartColor(task.colorVal),
        id: 'Air Pollution',
        labelAccessorFn: (dynamic row, _) => '${row.taskValue}',
      ),
    );
  }

  final List<DeveloperSeries> data = [
    DeveloperSeries(
      year: "5/12",
      developers: 300,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "7/12",
      developers: 600,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "9/12",
      developers: 700,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "11/12",
      developers: 800,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "13/12",
      developers: 900,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "15/12",
      developers: 1000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "17/12",
      developers: 1200,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "19/12",
      developers: 1300,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "21/12",
      developers: 1400,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "23/12",
      developers: 1500,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _seriesPieData = <charts.Series<dynamic, String>>[];
    _generateData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
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
                      controller: scrollController,
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
                              physics: const NeverScrollableScrollPhysics(),
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
                              physics: const NeverScrollableScrollPhysics(),
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
                              physics: const NeverScrollableScrollPhysics(),
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
                            kHeightBox15,
                            if (SizeConfig.isDesktop())
                              SizedBox(
                                height: 400,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: EarningThisMonth(
                                        data: dashBoardController
                                            .thisMonthDataList,
                                      ),
                                    ),
                                    kWidthBox15,
                                    const Expanded(
                                      child: BarChartSample1(),
                                    ),
                                  ],
                                ),
                              ),
                            if (!SizeConfig.isDesktop())
                              SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    EarningThisMonth(
                                      data:
                                          dashBoardController.thisMonthDataList,
                                    ),
                                    kHeightBox15,
                                    const SizedBox(
                                        height: 400, child: BarChartSample1()),
                                  ],
                                ),
                              ),
                            kHeightBox15,
                            if (SizeConfig.isDesktop())
                              Row(
                                children: [
                                  Expanded(
                                    child: DeveloperChart(
                                      data: data,
                                    ),
                                  ),
                                  kWidthBox15,
                                  Expanded(
                                    child: ExpenseRatio(
                                      data: data,
                                    ),
                                  ),
                                ],
                              ),
                            if (!SizeConfig.isDesktop())
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DeveloperChart(
                                    data: data,
                                  ),
                                  kHeightBox15,
                                  ExpenseRatio(
                                    data: data,
                                  ),
                                ],
                              ),
                            kHeightBox15,
                            if (SizeConfig.isDesktop())
                              SizedBox(
                                height: 400,
                                child: Row(
                                  children: [
                                    const Expanded(
                                      child: LineChartSample2(),
                                    ),
                                    kWidthBox15,
                                    const Expanded(
                                      child: PieChartSample2(),
                                    ),
                                  ],
                                ),
                              ),
                            kHeightBox15,
                            if (SizeConfig.isDesktop())
                              SizedBox(
                                height: 400,
                                child: Row(
                                  children: [
                                    const Expanded(
                                      child: LineChartSample1(),
                                    ),
                                    kWidthBox15,
                                    const Expanded(
                                      child: BarChartSample2(),
                                    ),
                                  ],
                                ),
                              ),
                            kHeightBox15,
                            if (SizeConfig.isDesktop())
                              SizedBox(
                                height: 400,
                                child: Row(
                                  children: [
                                    const Expanded(
                                      child: RadarChartSample1(),
                                    ),
                                    kWidthBox15,
                                    const Expanded(
                                      child: ScatterChartSample1(),
                                    ),
                                  ],
                                ),
                              ),
                            /* SizedBox(
                              height: 500,
                              child: charts.PieChart(_seriesPieData,
                                  animate: true,
                                  animationDuration: const Duration(seconds: 5),
                                  behaviors: [
                                    charts.DatumLegend(
                                      outsideJustification: charts
                                          .OutsideJustification.endDrawArea,
                                      horizontalFirst: false,
                                      desiredMaxRows: 2,
                                      cellPadding: const EdgeInsets.only(
                                          right: 4.0, bottom: 4.0),
                                      entryTextStyle: charts.TextStyleSpec(
                                          color: charts.MaterialPalette.purple
                                              .shadeDefault,
                                          fontFamily: 'Georgia',
                                          fontSize: 11),
                                    )
                                  ],
                                  defaultRenderer: charts.ArcRendererConfig(
                                      arcWidth: 100,
                                      arcRendererDecorators: [
                                        charts.ArcLabelDecorator(
                                            labelPosition:
                                                charts.ArcLabelPosition.inside)
                                      ])),
                            )*/
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

class Task {
  String task;
  double taskValue;
  Color colorVal;

  Task(
    this.task,
    this.taskValue,
    this.colorVal,
  );
}
