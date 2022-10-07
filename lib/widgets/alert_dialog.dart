import 'package:building_ui/core/exports/exports.dart';
import 'package:flutter/cupertino.dart';

Future<void> showMyAlertDialog(
    BuildContext context) async {
  showPermissionAlertDialog() {
    Widget cancelButton = TextButton(
      child:const Text('Continue Shopping') ,
      onPressed: () {
        context.router.replaceAll([const HomeRoute()]);
      },
    );

    Widget continueButton = TextButton(
      child: const Text("Go to Cart"),
      onPressed: () async {
        context.router.replaceAll([const CartPageRoute()]);
      },
    );

    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text('Continue shoppping? Or go to cart'),
            actions: [
              cancelButton,
              continueButton,
            ],
          );
        },
      );
    } else if (Platform.isIOS) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            content: const Text('Continue shoppping? Or go to cart'),
            actions: [
              cancelButton,
              continueButton,
            ],
          );
        },
      );
    }
  }

  showPermissionAlertDialog();
}
