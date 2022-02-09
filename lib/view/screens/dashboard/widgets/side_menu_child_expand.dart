import 'package:flutter/material.dart';
import 'package:flutter_dashboard/contstants/colors_data.dart';
import 'package:flutter_dashboard/contstants/style_data.dart';

class SideMenuChildExpand extends StatelessWidget {
  final double width;
  final String title;
  final bool isSelect;
  final Function? onTap;

  const SideMenuChildExpand(
      {Key? key,
      this.width = 200,
      required this.title,
      this.isSelect = false,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 2,
            ),
            Container(
              color: kHintColor,
              width: 12,
              height: 1,
            ),
            kWidthBox5,
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    color:
                        isSelect ? const Color(0xFFAF126E) : kStUnderLineColor,
                    fontSize: 14,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
