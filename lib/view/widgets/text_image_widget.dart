import 'package:flutter/material.dart';
import 'package:flutter_dashboard/contstants/colors_data.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextImageWidgets extends StatelessWidget {
  final String image;
  final String title;
  final bool isSelect;
  final Color color;
  final double space;

  const TextImageWidgets({
    Key? key,
    required this.image,
    required this.title,
    this.isSelect = false,
    this.color = kPrimaryColor,
    this.space = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 15,
          height: 15,
          child: SvgPicture.asset(
            image,
            color:
                isSelect ? color : Theme.of(context).textTheme.subtitle2?.color,
          ),
        ),
        SizedBox(
          width: space,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                color: isSelect
                    ? color
                    : Theme.of(context).textTheme.subtitle2?.color,
              ),
        ),
      ],
    );
  }
}
