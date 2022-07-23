import 'package:building_ui/exports/exports.dart';

class CustomTextField extends ConsumerWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? suffixIcon;
  const CustomTextField( {
    Key? key,
    required this.hintText,this.suffixIcon,
    this.controller,
    required this.obscureText
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.center,
      height: 50.0.h,
      decoration: BoxDecoration(
          color: AppColors.lightgreyColor,
          borderRadius: BorderRadius.all(Radius.circular(10.0.r))),
      child: TextFormField(
        controller: controller,
        cursorColor: AppColors.darkColor,
        style: const TextStyle(color: AppColors.whiteColor),  
        obscureText: obscureText,
        decoration: InputDecoration(
          suffixIcon: suffixIcon ,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0.r),
              ),
              borderSide: const BorderSide(
                color: AppColors.lightgreyColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0.r),
              ),
              borderSide: const BorderSide(
                color: AppColors.lightgreyColor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0.r),
              ),
            ),
            hintStyle: const TextStyle(color: AppColors.darkColor),
            hintText: hintText),
      ),
    );
  }
}
