
import 'package:building_ui/exports/exports.dart';
class ShoeSizes extends StatelessWidget {
  const ShoeSizes({Key? key, required this.size}) : super(key: key);
  final String size;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.whiteColor),
          borderRadius: BorderRadius.circular(15)),
      height: 40,
      width: 60,
      child: Text(size, style: AppStyles.productText),
    );
  }
}
