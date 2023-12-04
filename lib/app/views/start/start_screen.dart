import 'package:flutter/material.dart';
import 'package:tictactoe/app/routes/route_names.dart';
import 'package:tictactoe/services/navigation_service.dart';
import 'package:tictactoe/services/service_locator.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  locator<NavigationService>().navigateTo(Routes.gameScreen);
                },
                child: Text('Player VS Player')),
            ElevatedButton(
                onPressed: () {
                  locator<NavigationService>()
                      .navigateTo(Routes.gameScreen, arguments: 'ai');
                },
                child: Text('Player VS AI')),
            // ElevatedButton(
            //     onPressed: () {
            //       locator<NavigationService>()
            //           .navigateTo(Routes.bluetoothSearchScreen);
            //     },
            //     child: Text('Player VS Player (Bluetooth)')),
          ],
        ),
      )),
    );
  }
}
