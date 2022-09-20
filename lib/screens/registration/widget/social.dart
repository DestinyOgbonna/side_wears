import 'package:building_ui/core/exports/exports.dart';

Widget socialNetwork(String? image) {
  return Container(
    height: 40.0.h,
    width: 50.0.h,
    decoration: BoxDecoration(
        color: AppColors.lightgreyColor,
        borderRadius: BorderRadius.circular(15.0.r)),
    child: Image.asset(image!),
  );
}
