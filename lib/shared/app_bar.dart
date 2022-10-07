import 'package:building_ui/core/exports/exports.dart';

class MyAppBar extends ConsumerWidget {
  const MyAppBar(
      {Key? key,
      required this.title,
      this.isProfile,
      this.sideWidget,
      this.onPressed,
      required this.isSettings})
      : super(key: key);

  final String? title;
  final bool? isSettings;
  final bool? isProfile;
  final void Function()? onPressed;
  final Widget? sideWidget;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool _isSetting = isSettings ?? false;
    bool _isProfile = isProfile ?? false;
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      leading: _isProfile
          ? const Text('')
          : InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/icons/back.png',
                height: 10.0.h,
                color: AppColors.lightgreyColor,
              ),
            ),
      title: Center(
        child: Text(
          title!,
          style: AppStyles.boldgreyText,
        ),
      ),
      elevation: 0,
      actions: [
        _isSetting
            ? Padding(
                padding: EdgeInsets.only(right: 18.0.h),
                child: Center(
                    child: Text(
                  '',
                  style: AppStyles.mediumgreyText,
                )),
              )
            : Padding(
                padding: EdgeInsets.only(right: 18.0.h),
                child: Center(child: sideWidget),
              )
      ],
    );
  }
}
