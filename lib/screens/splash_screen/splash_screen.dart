import 'dart:async';
import 'package:building_ui/exports/exports.dart';

import '../../services/local_notification.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late final LocalNotificationService service;
  @override
  void initState() {
    super.initState();
    ref.read(mySplashScreenModel.notifier).checkInternetConnection();
    ref.read(mySignInViewmodel.notifier).saveUserLoginState(context);
    Timer(const Duration(milliseconds: 3000), () {
      context.router.replaceAll(const [SignUpPageRoute()]);

      service = LocalNotificationService();
      service.initialize();
      listenToNotification();
      service.showScheduledNotification();
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                'hoodie'.png,
                width: 150.w,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 100.h),
                child: CircularProgressIndicator(
                    backgroundColor: AppColors.whiteColor.withOpacity(.4),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.lightOrangeColor,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  void listenToNotification() {
    service.onNotificationClick.stream.listen(onNotificationListener);
  }

  void onNotificationListener(String? payload) {}
}
