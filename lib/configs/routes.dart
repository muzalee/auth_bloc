import 'package:flutter/material.dart';

import '../ui/common/dashboard_screen.dart';
import '../ui/screens/auth/auth_screen.dart';
import '../ui/screens/forgot_password/forgot_password_screen.dart';

enum Routes { splash, dashboard, auth, forgotPassword }

class _Paths {
  static const String dashboard = '/dashboard';
  static const String auth = '/auth';
  static const String forgotPassword = '/forgotPassword';

  static const Map<Routes, String> _pathMap = {
    Routes.dashboard: _Paths.dashboard,
    Routes.auth: _Paths.auth,
    Routes.forgotPassword: _Paths.forgotPassword,
  };

  static String of(Routes route) => _pathMap[route] ?? dashboard;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.auth:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AuthScreen());
      case _Paths.forgotPassword:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ForgotPasswordScreen());
      case _Paths.dashboard:
        return MaterialPageRoute(
            builder: (BuildContext context) => const DashboardScreen());
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => const DashboardScreen());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;
}
