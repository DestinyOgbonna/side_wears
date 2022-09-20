import 'package:building_ui/core/exports/exports.dart';

class CustomButton extends ConsumerWidget {
  final String buttonText;
  final double width;
  final bool isLoading;

  const CustomButton(
      {Key? key,
      required this.buttonText,
      this.isLoading = false,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///  bool _isFirstStrepperButton = isFirstStrepperButton ?? false;
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.lightgreyColor,
          borderRadius: BorderRadius.circular(15)),
      height: 60,
      // width: _isFirstStrepperButton ? 370 : 150,
      width: width,
      child: isLoading
          ? const CircularProgressIndicator.adaptive()
          : Text(buttonText, style: AppStyles.smallwhiteText),
    );
  }
}
