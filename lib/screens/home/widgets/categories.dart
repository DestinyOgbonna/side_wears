import 'package:building_ui/core/exports/exports.dart';

class Categories extends StatelessWidget {
  final String image;
  final String title;
  const Categories({Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 30,
          color: const Color(0XFF727A8B),
        ),
        SizedBox(height: 1.0.h),
        Text(title, style: AppStyles.smallgreyText)
      ],
    );
  }
}
