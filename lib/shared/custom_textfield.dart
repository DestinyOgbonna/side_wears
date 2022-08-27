import 'package:building_ui/exports/exports.dart';

class CustomTextField extends ConsumerWidget {
  final String labelText;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? suffixIcon;
  const CustomTextField(
      {Key? key,
      required this.labelText,
      this.suffixIcon,
      this.controller,
      required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.darkColor,
      style: const TextStyle(color: AppColors.blackColor),
      obscureText: obscureText,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0.r),
            ),
            borderSide: const BorderSide(
              color: AppColors.lightgreyColor,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0.r),
            ),
            borderSide: const BorderSide(
              color: AppColors.lightgreyColor,
            ),
          ),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0.r),
            ),
          ),
          labelStyle: const TextStyle(color: AppColors.darkColor),
          labelText: labelText),
    );
  }
}
