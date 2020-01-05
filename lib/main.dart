import 'package:News/routes/home/logic/home_screen_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/app_store.dart';
import 'common/preference_service.dart';
import 'routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sp = await SharedPreferences.getInstance();
  runApp(App(sp));
}

class App extends StatelessWidget {
  App(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PreferenceService>(
          create: (_) => PreferenceService(_sharedPreferences),
        ),
        ProxyProvider<PreferenceService, AppStore>(
          update: (_, preferenceService, __) => AppStore(preferenceService),
        ),
        ProxyProvider<PreferenceService, HomeScreenStore>(
          update: (_, preferenceService, __) => HomeScreenStore(preferenceService),
        )
      ],
      child: Consumer<AppStore>(
        builder: (context, appStore, _) {
          return Observer(
            builder: (_) => MaterialApp(
              theme: ThemeData(
                // TODO: Missing system preference
                brightness: appStore.useDarkMode ? Brightness.dark : Brightness.light,
                primarySwatch: Colors.red,
              ),
              home: (appStore.apiKey == null || appStore.apiKey.isEmpty) ? SetupScreen() : HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}
