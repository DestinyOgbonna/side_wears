import 'package:building_ui/core/exports/exports.dart';

class AppStyles {
  static const FontWeight _normalWeight = FontWeight.w500;
  static const FontWeight _boldWeight = FontWeight.w700;
  static TextStyle boldgreyText = GoogleFonts.lato(
    fontSize: 22.sp,
    color: AppColors.lightgreyColor,
    fontWeight: _boldWeight,
  );
  static TextStyle normalgreyText = GoogleFonts.lato(
    fontSize: 19.sp,
    color: AppColors.lightgreyColor,
    fontWeight: _normalWeight,
  );
  static TextStyle normalwhiteText = GoogleFonts.lato(
    fontSize: 19.sp,
    color: AppColors.whiteColor,
    fontWeight: _normalWeight,
  );
  static TextStyle mediumgreyText = GoogleFonts.lato(
    fontSize: 15.sp,
    color: AppColors.lightgreyColor,
    fontWeight: _normalWeight,
  );
  static TextStyle smallgreyText = GoogleFonts.lato(
    fontSize: 11.sp,
    color: AppColors.lightgreyColor,
    fontWeight: _normalWeight,
  );
  static TextStyle smallwhiteText = GoogleFonts.lato(
    fontSize: 11.sp,
    color: AppColors.whiteColor,
    fontWeight: _normalWeight,
  );
  static TextStyle smallblackText = GoogleFonts.lato(
    fontSize: 15.sp,
    color: AppColors.blackColor,
    fontWeight: _normalWeight,
  );
  static TextStyle productText = GoogleFonts.lato(
    fontSize: 15.sp,
    color: AppColors.whiteColor,
    fontWeight: _normalWeight,
  );
  static TextStyle paymentText = GoogleFonts.lato(
    fontSize: 18.sp,
    color: AppColors.lightgreyColor,
    fontWeight: _normalWeight,
  );
}
