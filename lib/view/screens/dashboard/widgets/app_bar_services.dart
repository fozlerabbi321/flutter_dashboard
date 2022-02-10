import 'package:flutter/material.dart';
import 'package:flutter_dashboard/controllers/dashboard_controller.dart';

import '../../../../contstants/colors_data.dart';

class AppBarServices extends StatelessWidget {
  final DashboardController dashboardController;
  const AppBarServices({Key? key, required this.dashboardController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < dashboardController.serviceList.length; i++)
          Row(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        5,
                      ),
                    ),
                    border: Border.all(color: kPrimaryColor, width: 1),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        dashboardController.serviceList[i],
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: kPrimaryColor,
                              height: 1.0,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
