import 'package:building_ui/exports/exports.dart';

class Categories extends StatelessWidget {
  final String image;
  final String title;
  const Categories({Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0XFF081936),
          radius: 25.r,
          child: Image.asset(
            image,
            height: 30,
            color: const Color(0XFF727A8B),
          ),
        ),
        SizedBox(height: 5.0.h),
        Text(title, style: AppStyles.smallgreyText)
      ],
    );
  }
}
