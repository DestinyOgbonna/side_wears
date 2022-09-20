import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/screens/Product%20Details/details/hoodie_details.dart';
import 'package:building_ui/screens/Product%20Details/details/shoes_details.dart';
import 'package:building_ui/screens/Product%20Details/details/watche_details.dart';
import 'package:building_ui/screens/splash_screen/splash_screen.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: SignUpPage, path: '/sign_up'),
    AutoRoute(page: SignInPage, path: '/sign_in'),
    AutoRoute(page: Home, path: '/home'),
    AutoRoute(page: CartPage, path: '/cart'),
    AutoRoute(page: HoodiesDetails, path: '/hoodie'),
    AutoRoute(page: WristWatchDetails, path: '/watches'),
    AutoRoute(page:ProfileUpdate, path: '/watches'),
    AutoRoute(page: ShoesDetails, path: '/profile'),
  ],
)
class $AppRouter {}
