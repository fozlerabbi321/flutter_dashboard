import 'package:flutter/material.dart';
import 'package:flutter_dashboard/view/screens/dashboard/widgets/side_menu_sub_expand.dart';
import 'package:flutter_dashboard/view/widgets/text_image_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../contstants/colors_data.dart';
import '../../../../contstants/images.dart';
import '../../../../contstants/size_config.dart';

class SideMenuExpandCard extends StatelessWidget {
  final double width;
  final String title;
  final String image;
  final bool isSelect;
  final Function? onTap;

  const SideMenuExpandCard(
      {Key? key,
      this.width = 200,
      required this.title,
      required this.image,
      this.isSelect = false,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as Function()?,
      child: SizedBox(
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: isSelect
                  ? const Color(0xFFAF126E)
                  : Theme.of(context).backgroundColor,
              width: 3,
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: width - 3.0,
                  padding: EdgeInsets.only(
                      left: SizeConfig.isDesktop() ? 15 : 10, right: 15),
                  decoration: BoxDecoration(
                    color: isSelect
                        ? const Color(0xFFe9f7f0)
                        : Theme.of(context).backgroundColor,
                    boxShadow: [
                      kOrdinaryShadow,
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextImageWidgets(
                          title: title,
                          image: Images.help,
                          color:
                              isSelect ? const Color(0xFFAF126E) : kHintColor,
                          isSelect: true,
                          space: SizeConfig.isDesktop() ? 15 : 10,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                        height: 15,
                        child: SvgPicture.asset(
                          image,
                          color:
                              isSelect ? const Color(0xFFAF126E) : kHintColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: isSelect
                      ? Container(
                          width: width - (SizeConfig.isDesktop() ? 23 : 13),
                          margin: EdgeInsets.only(
                            left: SizeConfig.isDesktop() ? 20 : 10,
                            top: 5,
                            bottom: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            border: const Border(
                              left: BorderSide(
                                  color: kStUnderLineColor, width: 1),
                            ),
                          ),
                          child: ListView.builder(
                              itemCount: 5,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return SideMenuSubExpand(
                                  title: 'Sub cat'.tr,
                                  isSelect: index == 4 ? true : false,
                                );
                              }),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
