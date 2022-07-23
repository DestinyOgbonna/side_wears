import 'package:building_ui/exports/exports.dart';
import 'package:building_ui/screens/profile_update/profile_update_viewmode;.dart';
import 'package:building_ui/screens/settings/settings_viewmodel.dart';

final mySignUpViewmodel =
    StateNotifierProvider<SignUpViewModel, SignUpViewState>(
        ((ref) => SignUpViewModel(ref.read)));

final mySignInViewmodel =
    StateNotifierProvider<SignInViewModel, SignInViewState>(
        ((ref) => SignInViewModel(ref.read)));

final myHomeScreenModel =
    StateNotifierProvider.autoDispose<HomeScreenViewModel, HomeScreenState>(
        ((ref) => HomeScreenViewModel()));
final mySplashScreenModel =
    StateNotifierProvider<SplashScreenViewModel, SplashScreenState>(
        ((ref) => SplashScreenViewModel()));
final myProfileScreenModel =
    StateNotifierProvider<ProfileViewModel, ProfileState>(
        ((ref) => ProfileViewModel()));
final mySettingsScreenModel =
    StateNotifierProvider<SettingsViewModel, SettingsViewState>(
        ((ref) => SettingsViewModel(ref.read)));
