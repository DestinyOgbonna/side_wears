import 'package:building_ui/exports/exports.dart';

class NotificationSwitch extends StatelessWidget {
  const NotificationSwitch({
    Key? key,
    required this.notificationType,
    required this.onTap,
    required this.switchControl,
    required this.isLoading,
  }) : super(key: key);

  final String notificationType;
  final void Function() onTap;
  final bool switchControl;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
              height: 38.w, width: 38.w, child: const Icon(Icons.toggle_off)),
          SizedBox(width: 11.w),
          Text(
            notificationType,
            style: Theme.of(context).textTheme.bodyText1!,
          ),
          Expanded(
            child: SizedBox(width: MediaQuery.of(context).size.width),
          ),
          isLoading
              ? Padding(
                  padding: EdgeInsets.fromLTRB(0, 3.h, 16.w, 3.h),
                  child: Center(
                    child: SizedBox(
                      width: 30.w,
                      height: 33.h,
                      child: const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.blackColor,
                      )),
                    ),
                  ),
                )
              : SizedBox(
                  height: 20.h,
                  child: Switch.adaptive(
                    onChanged: (value) => onTap(),
                    value: switchControl,
                    activeColor: const Color(0xffffffff),
                    activeTrackColor: const Color(0xff443DF6),
                  ),
                ),
        ],
      ),
    );
  }
}
