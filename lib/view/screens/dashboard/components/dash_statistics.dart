import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../contstants/size_config.dart';
import '../../../../contstants/style_data.dart';
import '../../../../models/response/scales_data.dart';

class DashStatistics extends StatelessWidget {
  final List<SalesData> data;
  const DashStatistics({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeightBox15,
        SizedBox(
          width: SizeConfig.screenWidth,
          child: Card(
            color: Theme.of(context).cardColor,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            elevation: 1.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Statistics'.tr,
                        style: SizeConfig.isDesktop()
                            ? Theme.of(context).textTheme.headline2
                            : Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                    kHeightBox20,
                    Center(
                      child: Container(
                        width: SizeConfig.screenWidth,
                        padding: const EdgeInsets.only(right: 10),
                        child: SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            // Chart title
                            // Enable legend
                            legend: Legend(isVisible: false),
                            // Enable tooltip
                            tooltipBehavior: TooltipBehavior(enable: false),
                            series: <ChartSeries<SalesData, String>>[
                              LineSeries<SalesData, String>(
                                dataSource: data,
                                xValueMapper: (SalesData sales, _) =>
                                    sales.year,
                                yValueMapper: (SalesData sales, _) =>
                                    sales.sales,
                                // Enable data label
                                dataLabelSettings:
                                    const DataLabelSettings(isVisible: true),
                              ),
                            ]),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
