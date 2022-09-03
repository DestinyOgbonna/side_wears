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
    return Card(
      //  elevation: 100,
      color: AppColors.darkerBlueColor.withOpacity(1),

      child: Stack(
        children: [
          Container(
            height: 350.0.h,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(prodImage), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(5.0.r),
            ),
          ),
          Positioned(
            top: 100.0.h,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(5.0.r),
              ),
              margin: EdgeInsets.symmetric(horizontal: 5.0.w),
              height: 40.0.h,
              width: 145.0.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(prodName, style: AppStyles.smallgreyText),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(prodPrice, style: AppStyles.normalgreyText),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
