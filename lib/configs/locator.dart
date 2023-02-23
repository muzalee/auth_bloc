import 'package:auth_bloc/utils/app_orientation.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<OrientationNotifier>(OrientationNotifier());
}