import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/app/routes/route_names.dart';
import 'package:tictactoe/app/views/game/bloc/game_state_bloc/game_cubit.dart';
import 'package:tictactoe/app/views/game/game_screen.dart';
import 'package:tictactoe/app/views/start/start_screen.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    Object? arguments = settings.arguments;

    switch (settings.name) {
      case Routes.startScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => StartScreen());

      case Routes.gameScreen:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => BlocProvider(
                  create: (context) =>
                      GameCubit()..buildBoard(gameType: arguments.toString()),
                  child: GameScreen(),
                ));

      default:
        return MaterialPageRoute(
            settings: settings, builder: (_) => StartScreen());
    }
  }
}
