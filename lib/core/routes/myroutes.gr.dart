// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:building_ui/core/exports/exports.dart' as _i2;
import 'package:building_ui/screens/Product%20Details/details/hoodie_details.dart'
    as _i3;
import 'package:building_ui/screens/Product%20Details/details/shoes_details.dart'
    as _i5;
import 'package:building_ui/screens/Product%20Details/details/watche_details.dart'
    as _i4;
import 'package:building_ui/screens/splash_screen/splash_screen.dart' as _i1;
import 'package:flutter/material.dart' as _i7;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    SignUpPageRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.SignUpPage());
    },
    SignInPageRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.SignInPage());
    },
    HomeRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.Home());
    },
    CartPageRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.CartPage());
    },
    HoodiesDetailsRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.HoodiesDetails());
    },
    WristWatchDetailsRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.WristWatchDetails());
    },
    ProfileUpdateRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.ProfileUpdate());
    },
    ShoesDetailsRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.ShoesDetails());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i6.RouteConfig(SignUpPageRoute.name, path: '/sign_up'),
        _i6.RouteConfig(SignInPageRoute.name, path: '/sign_in'),
        _i6.RouteConfig(HomeRoute.name, path: '/home'),
        _i6.RouteConfig(CartPageRoute.name, path: '/cart'),
        _i6.RouteConfig(HoodiesDetailsRoute.name, path: '/hoodie'),
        _i6.RouteConfig(WristWatchDetailsRoute.name, path: '/watches'),
        _i6.RouteConfig(ProfileUpdateRoute.name, path: '/watches'),
        _i6.RouteConfig(ShoesDetailsRoute.name, path: '/profile')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i6.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.SignUpPage]
class SignUpPageRoute extends _i6.PageRouteInfo<void> {
  const SignUpPageRoute() : super(SignUpPageRoute.name, path: '/sign_up');

  static const String name = 'SignUpPageRoute';
}

/// generated route for
/// [_i2.SignInPage]
class SignInPageRoute extends _i6.PageRouteInfo<void> {
  const SignInPageRoute() : super(SignInPageRoute.name, path: '/sign_in');

  static const String name = 'SignInPageRoute';
}

/// generated route for
/// [_i2.Home]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.CartPage]
class CartPageRoute extends _i6.PageRouteInfo<void> {
  const CartPageRoute() : super(CartPageRoute.name, path: '/cart');

  static const String name = 'CartPageRoute';
}

/// generated route for
/// [_i3.HoodiesDetails]
class HoodiesDetailsRoute extends _i6.PageRouteInfo<void> {
  const HoodiesDetailsRoute()
      : super(HoodiesDetailsRoute.name, path: '/hoodie');

  static const String name = 'HoodiesDetailsRoute';
}

/// generated route for
/// [_i4.WristWatchDetails]
class WristWatchDetailsRoute extends _i6.PageRouteInfo<void> {
  const WristWatchDetailsRoute()
      : super(WristWatchDetailsRoute.name, path: '/watches');

  static const String name = 'WristWatchDetailsRoute';
}

/// generated route for
/// [_i2.ProfileUpdate]
class ProfileUpdateRoute extends _i6.PageRouteInfo<void> {
  const ProfileUpdateRoute() : super(ProfileUpdateRoute.name, path: '/watches');

  static const String name = 'ProfileUpdateRoute';
}

/// generated route for
/// [_i5.ShoesDetails]
class ShoesDetailsRoute extends _i6.PageRouteInfo<void> {
  const ShoesDetailsRoute() : super(ShoesDetailsRoute.name, path: '/profile');

  static const String name = 'ShoesDetailsRoute';
}
