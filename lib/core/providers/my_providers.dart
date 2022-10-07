import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/core/repository/cart_repository.dart';
import 'package:building_ui/core/repository/favorites_repository.dart';
import 'package:building_ui/core/repository/products_repository.dart';

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
        ref.watch(firebaseCollectionService),
        ref.watch(productRepositiry)
      )),
);

//*SPLASHSCREEN PROVIDER
final mySplashScreenModel =
    StateNotifierProvider<SplashScreenViewModel, SplashScreenState>(
        ((ref) => SplashScreenViewModel(ref.read)));

//*PROFILESCREEN PROVIDER
final myProfileUpdateScreenModel = StateNotifierProvider.autoDispose<
    ProfileUpdateViewModel, ProfileUpdateState>(
  ((ref) => ProfileUpdateViewModel(FileStorage(), ref.read)),
);

//*SETTINGS PROVIDER
final myprofileScreenModel =
    StateNotifierProvider<ProfileViewModel, ProfileViewState>(
  ((ref) => ProfileViewModel(
        ref.read,
        ref.watch(firebaseCollectionService),
      )),
);

//*PRODUCT DETAILS PROVIDER
final myProductsDetailsScreenModel =
    StateNotifierProvider<ProductDetailsViewModel, ProductDetailsViewState>(
  ((ref) => ProductDetailsViewModel(
        ref.watch(firebaseCollectionService),
        ref.watch(productRepositiry),
        ref.watch(cartRepository),
        ref.watch(favoriteRepository)
      )),
);

//*PAYMENT SCREEN PROVIDER
final myPaymentScreenModel =
    StateNotifierProvider<PaymentViewModel, PaymentViewState>(
        ((ref) => PaymentViewModel()));

//*CART PROVIDER
final myCartcreenModel = StateNotifierProvider<CartViewModel, CartViewState>(
  ((ref) => CartViewModel(
        ref.watch(firebaseCollectionService),
        ref.watch(firebaseAuthService),
        ProductDetailsViewModel(
          ref.watch(firebaseCollectionService),
          ref.watch(productRepositiry),
          ref.watch(cartRepository),
          ref.watch(favoriteRepository)
        ),
      )),
);

//*FAVORITE PROVIDER
final myFavoritescreenModel =
    StateNotifierProvider<FavoriteViewModel, FavoriteViewState>(
  ((ref) => FavoriteViewModel(
        ref.watch(firebaseAuthService),
        ref.watch(firebaseCollectionService),
        ref.watch(favoriteRepository)
      )),
);

final themingProvider = ChangeNotifierProvider<AppThemeProvider>(
  (ref) => AppThemeProvider(),
);
