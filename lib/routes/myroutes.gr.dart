// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:building_ui/exports/exports.dart' as _i2;
import 'package:building_ui/screens/splash_screen/splash_screen.dart' as _i1;
import 'package:flutter/material.dart' as _i4;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    SignUpPageRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.SignUpPage());
    },
    SignInPageRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.SignInPage());
    },
    HomeRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.Home());
    },
    ProductDetailsRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.ProductDetails());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i3.RouteConfig(SignUpPageRoute.name, path: '/sign_up'),
        _i3.RouteConfig(SignInPageRoute.name, path: '/sign_in'),
        _i3.RouteConfig(HomeRoute.name, path: '/home'),
        _i3.RouteConfig(ProductDetailsRoute.name, path: '/product_details')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i3.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.SignUpPage]
class SignUpPageRoute extends _i3.PageRouteInfo<void> {
  const SignUpPageRoute() : super(SignUpPageRoute.name, path: '/sign_up');

  static const String name = 'SignUpPageRoute';
}

/// generated route for
/// [_i2.SignInPage]
class SignInPageRoute extends _i3.PageRouteInfo<void> {
  const SignInPageRoute() : super(SignInPageRoute.name, path: '/sign_in');

  static const String name = 'SignInPageRoute';
}

/// generated route for
/// [_i2.Home]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.ProductDetails]
class ProductDetailsRoute extends _i3.PageRouteInfo<void> {
  const ProductDetailsRoute()
      : super(ProductDetailsRoute.name, path: '/product_details');

  static const String name = 'ProductDetailsRoute';
}
