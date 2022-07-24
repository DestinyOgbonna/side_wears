import 'package:building_ui/exports/exports.dart';

class AccountsBar extends ConsumerWidget {
  const AccountsBar({
    Key? key,
    required this.titleText,
    required this.subText,
    this.icons,
  }) : super(key: key);
  final String? titleText;
  final String subText;
  final Icon? icons;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(
        titleText!,
        style: AppStyles.normalgreyText,
      ),
      subtitle: Text(subText, style: AppStyles.smallgreyText),
      leading: CircleAvatar(
          minRadius: 25.0.r,
          maxRadius: 30.0.r,
          backgroundColor: AppColors.lightgreyColor,
          child: const Icon(Icons.person)),
      trailing: Container(
        decoration: BoxDecoration(
            // color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10.0.r)),
        width: 40,
        height: 40,
        child: const Icon(
          Icons.arrow_right_sharp,
          color: AppColors.lightgreyColor,
          size: 40,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SettingsBar extends ConsumerStatefulWidget {
  SettingsBar({
    this.isSwitched = false,
    Key? key,
    required this.titleText,
    this.icons,
    this.isDarkMode,
  }) : super(key: key);
  final String? titleText;
  final bool? isDarkMode;
  bool isSwitched;
  final Icon? icons;

  @override
  ConsumerState<SettingsBar> createState() => _SettingsBarState();
}

class _SettingsBarState extends ConsumerState<SettingsBar> {
  @override
  Widget build(BuildContext context) {
    bool _isDarkMode = widget.isDarkMode ?? false;
    return ListTile(
      title: Text(
        widget.titleText!,
        style: AppStyles.normalgreyText,
      ),
      leading: CircleAvatar(
          minRadius: 25.0.r,
          maxRadius: 30.0.r,
          backgroundColor: AppColors.lightgreyColor,
          child: widget.icons),
      trailing: _isDarkMode
          ? Switch.adaptive(
              value: widget.isSwitched,
              onChanged: (value) {
                setState(() {
                  widget.isSwitched = value;
                });
              },
              activeColor: AppColors.lightgreyColor,
              activeTrackColor: const Color.fromARGB(255, 131, 138, 152),
              inactiveTrackColor: const Color.fromARGB(255, 131, 138, 152),
            )
          : Container(
              decoration: BoxDecoration(
                  //   color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10.0.r)),
              width: 40,
              height: 40,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_right_sharp,
                  size: 40,
                  color: AppColors.lightgreyColor,
                ),
                onPressed: () {},
              ),
            ),
    );
  }
}
