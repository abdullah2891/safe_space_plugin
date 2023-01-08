import 'package:flutter/material.dart';

final Routes routes = Routes();

// typedef _RoutePredicate = bool Function(Route<dynamic>);

class Routes {
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  Future<String?> restorablePushNamed<T extends Object?>(
    String routeName, {
    Object? args,
  }) async {
    return navigationKey.currentState?.restorablePushNamed<T>(
      routeName,
      arguments: args,
    );
  }

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? args,
  }) async {
    return navigationKey.currentState?.pushNamed<T>(
      routeName,
      arguments: args,
    );
  }
}
