import 'package:flutter/material.dart';
import 'package:tictactoe/app/routes/route_generator.dart';
import 'package:tictactoe/app/routes/route_names.dart';
import 'package:tictactoe/app/views/start/start_screen.dart';
import 'package:tictactoe/l10n/l10n.dart';
import 'package:tictactoe/services/navigation_service.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: Routes.startScreen,
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

