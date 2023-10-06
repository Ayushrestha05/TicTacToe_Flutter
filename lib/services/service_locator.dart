import 'package:get_it/get_it.dart';
import 'package:tictactoe/services/navigation_service.dart';
import 'package:tictactoe/services/shared_pref_services.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator()  async {
  locator.registerSingleton<NavigationService>(NavigationService());
  locator.registerSingleton<SharedPrefsServices>(SharedPrefsServices());
}
