import 'package:building_ui/exports/exports.dart';



Widget totalDetails(String total, String detail) {
  return ListTile(
    trailing: Text(
      total,
      style: AppStyles.smallgreyText,
    ),
    leading: Text(
      detail,
      style: AppStyles.mediumgreyText,
    ),
  );
}
