import 'package:building_ui/exports/exports.dart';

class MyAppBar extends ConsumerWidget {
  MyAppBar(
      {Key? key,
      required this.title,
      this.isProfile,
      this.onPressed,
      required this.isSettings})
      : super(key: key);

  String? title;
  final bool? isSettings;
  final bool? isProfile;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool _isSetting = isSettings ?? false;
    bool _isProfile = isProfile ?? false;
    return AppBar(
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
          style: AppStyles.boldwhiteText,
        ),
      ),
      elevation: 0,
      actions: [
        _isSetting
            ? Padding(
                padding: EdgeInsets.only(right: 18.0.h),
                child: Center(
                    child: Text(
                  'Done',
                  style: AppStyles.mediumgreyText,
                )),
              )
            : _isProfile
                ? Padding(
                    padding: EdgeInsets.only(right: 18.0.h),
                    child: const Center(child: Text('')),
                  )
                : Center(
                    child: IconButton(
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: AppColors.whiteColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CartPage()));
                      },
                    ),
                  ),
      ],
    );
  }
}
