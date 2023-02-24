import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sizer/sizer.dart';

import 'bloc/app/app_bloc.dart';
import 'configs/locator.dart';
import 'configs/routes.dart';
import 'ui/common/dashboard_screen.dart';
import 'ui/screens/auth/auth_screen.dart';
import 'utils/app_orientation.dart';
import 'utils/bloc_observer.dart';
import 'utils/const/color_const.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          final orientationNotifier = getIt.get<OrientationNotifier>();

          if (orientation != orientationNotifier.orientation) {
            orientationNotifier.setOrientation(orientation);
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: AppNavigator.navigatorKey,
            onGenerateRoute: AppNavigator.onGenerateRoute,
            theme: ThemeData(
              primaryColor: ColorConst.primary,
            ),
            home: BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                if (state is Unauthenticated) {
                  FlutterNativeSplash.remove();
                  return const AuthScreen();
                } else if (state is Authenticated) {
                  FlutterNativeSplash.remove();
                  return const DashboardScreen();
                }

                return const SizedBox();
              },
            ),
          );
        }
    );
  }

  static void init() {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight, DeviceOrientation.portraitUp]);
    Bloc.observer = SimpleBlocObserver();
    setupLocator();
  }

  static Widget runWidget() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppBloc(context: context)..add(AppInit()),
        ),
      ],
      child: const MyApp(),
    );
  }
}