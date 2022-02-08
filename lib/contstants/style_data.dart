import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_data.dart';
import 'size_config.dart';

//app main them
const kBrightnessTheme = Brightness.light;
//Space margin or padding
const double kPaddingExtraSmall = 5.0;
const double kPaddingSmall = 10.0;
const double kPaddingDefault = 10.0;
const double kPaddingLarge = 15.0;
const double kPaddingExtraLarge = 15.0;
//Font size
double kFontSizeExtraSmall = Get.context!.width >= 1366 ? 14 : 10;
double kFontSizeSmall = Get.context!.width >= 1366 ? 16 : 12;
double kFontSizeDefault = Get.context!.width >= 1366 ? 18 : 14;
double kFontSizeLarge = Get.context!.width >= 1366 ? 20 : 16;
double kFontSizeExtraLarge = Get.context!.width >= 1366 ? 22 : 18;
double kFontSizeOverLarge = Get.context!.width >= 1366 ? 28 : 24;

const double radiusSmall = 5.0;
const double radiusDefault = 10.0;
const double radiusLarge = 15.0;
const double radiusExtraLarge = 20.0;

///start
//FontWeight
const weight400 = FontWeight.w400;
const weight500 = FontWeight.w500;
const weight600 = FontWeight.w600;
const weight700 = FontWeight.w700;
const weightBold = FontWeight.bold;

//SizedBox Height
final kHeightBox5 = SizedBox(height: getProportionateScreenHeight(5));
final kHeightBox8 = SizedBox(height: getProportionateScreenHeight(8));
final kHeightBox10 = SizedBox(height: getProportionateScreenHeight(10));
final kHeightBox15 = SizedBox(height: getProportionateScreenHeight(15));
final kHeightBox20 = SizedBox(height: getProportionateScreenHeight(20));
final kHeightBox25 = SizedBox(height: getProportionateScreenHeight(25));
final kHeightBox30 = SizedBox(height: getProportionateScreenHeight(30));
final kHeightBox40 = SizedBox(height: getProportionateScreenHeight(40));

//SizedBox Width
final kWidthBox5 = SizedBox(width: getProportionateScreenHeight(5));
final kWidthBox10 = SizedBox(width: getProportionateScreenHeight(10));
final kWidthBox15 = SizedBox(width: getProportionateScreenHeight(15));
final kWidthBox20 = SizedBox(width: getProportionateScreenHeight(20));
final kWidthBox25 = SizedBox(width: getProportionateScreenHeight(25));

//Axis Alignment
const crossAxisCenter = CrossAxisAlignment.center;
const mainAxisCenter = MainAxisAlignment.center;
const mainAxisStart = MainAxisAlignment.start;
const crossAxisStart = CrossAxisAlignment.start;
const mainAxisSpaceBetween = MainAxisAlignment.spaceBetween;

//Container BoxDecoration

BoxDecoration containerBoxDecoration(
    {required double borderRadius, Color? color, List<BoxShadow>? boxShadow}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(borderRadius),
    color: color,
    boxShadow: boxShadow,
  );
}

final kHomeTitle = TextStyle(
  color: kBlackColor2,
  fontWeight: FontWeight.w600,
  fontSize: getProportionateScreenWidth(18),
);

final kHeadLine = TextStyle(
  fontSize: getProportionateScreenWidth(34.0),
  fontWeight: FontWeight.w700,
  height: 1.25,
);
final kHeadLineTest = TextStyle(
  fontSize: getProportionateScreenWidth(34.0),
  fontWeight: FontWeight.w700,
  height: 1.25,
);
final kHeadLine2 = TextStyle(
  fontSize: getProportionateScreenWidth(24.0),
  fontWeight: FontWeight.w600,
  height: 1.25,
);
final kHeadLine3 = TextStyle(
  fontSize: getProportionateScreenWidth(22.0),
  fontWeight: FontWeight.w500,
  height: 1.25,
);
final kAppBarText = TextStyle(
  fontSize: getProportionateScreenWidth(18.0),
  fontWeight: FontWeight.w500,
  height: 1.25,
);
final kRegularText = TextStyle(
  fontSize: getProportionateScreenWidth(16.0),
  fontWeight: FontWeight.w300,
  height: 1.25,
);
final kRegularText2 = TextStyle(
  fontSize: getProportionateScreenWidth(15.0),
  fontWeight: FontWeight.w400,
  height: 1.25,
  color: const Color(0xFF303030),
  fontStyle: FontStyle.normal,
);
final kDescriptionText = TextStyle(
  fontSize: getProportionateScreenWidth(12.0),
  fontWeight: FontWeight.w400,
  height: 1.0,
  color: const Color(0xFF707070),
  fontStyle: FontStyle.normal,
);
final kSmallText = TextStyle(
  fontSize: getProportionateScreenWidth(11.0),
  fontWeight: FontWeight.w400,
  height: 1.25,
);

final kBoldStyle = TextStyle(
  fontSize: getProportionateScreenWidth(16.0),
  fontWeight: FontWeight.bold,
  height: 1.25,
);

void showCustomSnackBar(String message, {bool isError = true}) {
  Get.showSnackbar(GetSnackBar(
    backgroundColor: isError ? Colors.red : Colors.green,
    message: message,
    maxWidth: 1170,
    duration: const Duration(seconds: 3),
    snackStyle: SnackStyle.FLOATING,
    margin: const EdgeInsets.all(10),
    borderRadius: 5,
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
  ));
}

Text textRoboto(String title, Color color,
    {double? fontSize,
    FontWeight? fontWeight,
    int? maxLine,
    TextDecoration? textDecoration}) {
  return Text(
    title,
    style: GoogleFonts.roboto(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        decoration: textDecoration),
    maxLines: maxLine ?? 1,
    overflow: TextOverflow.ellipsis,
    softWrap: false,
  );
}

const TextStyle bodyUnseenText1 = TextStyle(
    color: Color(0xff686795),
    fontSize: 14,
    letterSpacing: 1.2,
    fontWeight: FontWeight.bold);

const TextStyle heading2 = TextStyle(
  color: Color(0xff686795),
  fontSize: 18,
  fontWeight: FontWeight.w600,
  letterSpacing: 1.5,
);

const TextStyle chatSenderName = TextStyle(
  color: Colors.white,
  fontSize: 24,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.5,
);

const TextStyle bodyText1 = TextStyle(
    color: Color(0xffAEABC9),
    fontSize: 14,
    letterSpacing: 1.2,
    fontWeight: FontWeight.w500);

const TextStyle bodyTextMessage =
    TextStyle(fontSize: 13, letterSpacing: 1.5, fontWeight: FontWeight.w600);

const TextStyle bodyTextTime = TextStyle(
  color: Color(0xffAEABC9),
  fontSize: 11,
  fontWeight: FontWeight.bold,
  letterSpacing: 1,
);

final otpInputDecoration = InputDecoration(
  fillColor: kWhiteColor,
  contentPadding: const EdgeInsets.symmetric(vertical: 15),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: kOrdinaryColor),
  );
}

kErrorSnack({@required String? msg, Color color = kErrorColor}) {
  return Get.snackbar(msg ?? '', '',
      colorText: Colors.white,
      backgroundColor: color,
      snackPosition: SnackPosition.BOTTOM);
}

kRightSnack({
  @required String? msg,
  Color color = Colors.green,
}) {
  return Get.snackbar(msg ?? '', '',
      colorText: Colors.white,
      backgroundColor: color,
      snackPosition: SnackPosition.BOTTOM);
}

Widget getCircularImage(double size, String imageURL) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(size / 2))),
    child: ClipOval(
        child: FadeInImage.assetNetwork(
            fit: BoxFit.cover,
            placeholder: 'assets/images/man_placeholder.jpg',
            image: imageURL)),
  );
}
