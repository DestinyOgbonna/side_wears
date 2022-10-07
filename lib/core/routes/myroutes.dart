import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/screens/product_details/details/hoodie_details.dart';
import 'package:building_ui/screens/product_details/details/shoes_details.dart';
import 'package:building_ui/screens/product_details/details/watche_details.dart';
import 'package:building_ui/screens/splash_screen/splash_screen.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: SignUpPage, path: '/sign_up'),
    AutoRoute(page: SignInPage, path: '/sign_in'),
    AutoRoute(
      page: Home,
      path: '/home',
      // children: [
      //   AutoRoute(page: CartPage, path: '/cart'),
      // ],
    ),
    AutoRoute(page: HoodiesDetails, path: '/hoodie'),
    AutoRoute(page: WristWatchDetails, path: '/watches'),
    AutoRoute(page: ProfileUpdate, path: '/profile_update'),
    AutoRoute(page: ShoesDetails, path: '/shoe_details'),
    AutoRoute(page: CartPage, path: '/cart'),
    AutoRoute(page: PaymentView, path: '/payment'),
    AutoRoute(page: AddressPage, path: '/address'),
  ],
)
class $AppRouter {}
