import 'package:building_ui/exports/exports.dart';
import 'package:building_ui/providers/theme.dart';
import 'package:building_ui/screens/Product%20Details/product_details_viewmodel.dart';
import 'package:building_ui/screens/profile_update/profile_update_viewmodel.dart';
import 'package:building_ui/screens/settings/settings_viewmodel.dart';

final mySignUpViewmodel =
    StateNotifierProvider<SignUpViewModel, SignUpViewState>(
        ((ref) => SignUpViewModel(ref.read)));

final mySignInViewmodel =
    StateNotifierProvider<SignInViewModel, SignInViewState>(
        ((ref) => SignInViewModel(ref.read)));

final myHomeScreenModel =
    StateNotifierProvider<HomeScreenViewModel, HomeScreenState>(
        ((ref) => HomeScreenViewModel()));
final mySplashScreenModel =
    StateNotifierProvider.autoDispose<SplashScreenViewModel, SplashScreenState>(
        ((ref) => SplashScreenViewModel()));
final myProfileScreenModel =
    StateNotifierProvider<ProfileViewModel, ProfileState>(
        ((ref) => ProfileViewModel()));
final mySettingsScreenModel =
    StateNotifierProvider<SettingsViewModel, SettingsViewState>(
        ((ref) => SettingsViewModel(ref.read)));
final myProductsDetailsScreenModel =
    StateNotifierProvider<ProductDetailsViewModel, ProductDetailsViewState>(
        ((ref) => ProductDetailsViewModel()));

        final themingProvider = ChangeNotifierProvider<AppThemeProvider>((ref) => AppThemeProvider());
