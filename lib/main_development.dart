import 'package:flutter/material.dart';
import 'package:tictactoe/app/app.dart';
import 'package:tictactoe/bootstrap.dart';
import 'package:tictactoe/services/service_locator.dart';
import 'package:tictactoe/services/shared_pref_services.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Future.wait(
    [
      setupLocator().then(
            (value) async => {
          await locator<SharedPrefsServices>().init(),
        },
      ),
    ],
  );

  bootstrap(() => App());
}
