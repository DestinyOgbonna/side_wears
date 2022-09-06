import 'package:building_ui/exports/exports.dart';
import 'package:building_ui/providers/theme.dart';
import 'package:building_ui/screens/Product%20Details/product_details_viewmodel.dart';
import 'package:building_ui/screens/profile_update/profile_update_viewmodel.dart';
import 'package:building_ui/screens/settings/settings_viewmodel.dart';

import '../screens/payment_flow/paymentflow_viewmodel.dart';

final mySignUpViewmodel =
    StateNotifierProvider<SignUpViewModel, SignUpViewState>(
        ((ref) => SignUpViewModel(ref.read)));

final mySignInViewmodel =
    StateNotifierProvider<SignInViewModel, SignInViewState>(
        ((ref) => SignInViewModel(ref.read)));

final myHomeScreenModel =
    StateNotifierProvider<HomeScreenViewModel, HomeScreenState>(
        ((ref) => HomeScreenViewModel(FirestoreCollectionService())));
final mySplashScreenModel =
    StateNotifierProvider.autoDispose<SplashScreenViewModel, SplashScreenState>(
        ((ref) => SplashScreenViewModel()));
final myProfileScreenModel =
    StateNotifierProvider.autoDispose<ProfileViewModel, ProfileState>(
        ((ref) => ProfileViewModel()));
final mySettingsScreenModel =
    StateNotifierProvider<SettingsViewModel, SettingsViewState>(
        ((ref) => SettingsViewModel(ref.read,FirestoreCollectionService())));
final myProductsDetailsScreenModel =
    StateNotifierProvider<ProductDetailsViewModel, ProductDetailsViewState>(
        ((ref) => ProductDetailsViewModel(FirestoreCollectionService())));
final myPaymentScreenModel =
    StateNotifierProvider<PaymentViewModel, PaymentViewState>(
        ((ref) => PaymentViewModel()));

  final themingProvider = ChangeNotifierProvider<AppThemeProvider>((ref) => AppThemeProvider());
