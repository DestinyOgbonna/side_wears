import 'package:building_ui/exports/exports.dart';
import 'package:building_ui/screens/splash_screen/splash_screen.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: SplashScreen, initial: true),
  AutoRoute(page: SignUpPage, path: '/sign_up'),
  AutoRoute(page: SignInPage, path: '/sign_in'),
  AutoRoute(page: Home, path: '/home'),
  AutoRoute(page: ProductDetails, path: '/product_details'),
  AutoRoute(page: CartPage, path: '/cart'),
  AutoRoute(page: ProfileUpdate, path: '/profile'),
 

])
class $AppRouter {}
