import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/core/providers/theme.dart';
import 'package:building_ui/core/services/firebase_storage.dart';
import 'package:building_ui/screens/Product%20Details/product_details_viewmodel.dart';
import 'package:building_ui/screens/cart/cart_viewmodel.dart';
import 'package:building_ui/screens/favourite/favourite_viewmodel.dart';
import 'package:building_ui/screens/payment_flow/paymentflow_viewmodel.dart';
import 'package:building_ui/screens/profile_update/profile_update_viewmodel.dart';
import 'package:building_ui/screens/settings/settings_viewmodel.dart';
import 'package:building_ui/core/services/firebase.dart';

//*SIGN UP PROVIDER
final mySignUpViewmodel =
    StateNotifierProvider<SignUpViewModel, SignUpViewState>(
  ((ref) => SignUpViewModel(ref.read)),
);
//*SIGN IN PROVIDER
final mySignInViewmodel =
    StateNotifierProvider<SignInViewModel, SignInViewState>(
  ((ref) => SignInViewModel(ref.read)),
);
//*HOMESCREEN PROVIDER
final myHomeScreenModel =
    StateNotifierProvider<HomeScreenViewModel, HomeScreenState>(
  ((ref) => HomeScreenViewModel(
        FirestoreCollectionService(),
      )),
);
//*SPLASHSCREEN PROVIDER
final mySplashScreenModel =
    StateNotifierProvider.autoDispose<SplashScreenViewModel, SplashScreenState>(
        ((ref) => SplashScreenViewModel()));
final myProfileScreenModel =
    StateNotifierProvider.autoDispose<ProfileViewModel, ProfileState>(
  ((ref) => ProfileViewModel(FileStorage())),
);

//*SETTINGS PROVIDER
final mySettingsScreenModel =
    StateNotifierProvider<SettingsViewModel, SettingsViewState>(
  ((ref) => SettingsViewModel(
        ref.read,
        FirestoreCollectionService(),
      )),
);
//*PRODUCT DETAILS PROVIDER
final myProductsDetailsScreenModel =
    StateNotifierProvider<ProductDetailsViewModel, ProductDetailsViewState>(
  ((ref) => ProductDetailsViewModel(
        FirestoreCollectionService(),
      )),
);
//*PAYMENT SCREEN PROVIDER
final myPaymentScreenModel =
    StateNotifierProvider<PaymentViewModel, PaymentViewState>(
        ((ref) => PaymentViewModel()));

//*CART PROVIDER
final myCartcreenModel = StateNotifierProvider<CartViewModel, CartViewState>(
  ((ref) => CartViewModel(
        FirestoreCollectionService(),
        FirebaseAuthService(),
        ProductDetailsViewModel(
          FirestoreCollectionService(),
        ),
      )),
);

//*FAVORITE PROVIDER
final myFavoritescreenModel =
    StateNotifierProvider<FavoriteViewModel, FavoriteViewState>(
  ((ref) => FavoriteViewModel(
        FirestoreCollectionService(),
        ProductDetailsViewModel(
          FirestoreCollectionService(),
        ),
      )),
);

final themingProvider = ChangeNotifierProvider<AppThemeProvider>(
  (ref) => AppThemeProvider(),
);
