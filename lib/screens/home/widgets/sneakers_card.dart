import 'package:building_ui/exports/exports.dart';

class Sneakers extends StatelessWidget {
  final String prodImage;
  final String prodName;
  final String prodPrice;
  final Function? ontap;
  const Sneakers(
      {Key? key,
      this.ontap,
      required this.prodImage,
      required this.prodName,
      required this.prodPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.0.h,
      width: 80.0.w,
      child: Card(
        //  elevation: 100,
        color: AppColors.darkerBlueColor.withOpacity(1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              prodImage,
              height: 100.0.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(prodPrice, style: AppStyles.normalgreyText),
            ),
            SizedBox(height: 5.0.h),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(prodName, style: AppStyles.smallgreyText),
            ),
          ],
        ),
      ),
    );
  }
}
