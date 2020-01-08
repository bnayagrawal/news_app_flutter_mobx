import 'package:News/data/model/top_headlines.dart';
import 'package:News/routes/home/logic/home_screen_store.dart';
import 'package:News/routes/home/pages/topheadlines/logic/top_headlines_service.dart';
import 'package:News/routes/home/pages/topheadlines/logic/top_headlines_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/app_store.dart';
import 'package:News/routes/home/pages/settings/settings_store.dart';
import 'common/preference_service.dart';
import 'routes/routes.dart';
import 'common/themes.dart' as Themes;

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
        ProxyProvider<AppStore, SettingsStore>(
          update: (_, appStore, __) => SettingsStore(appStore),
        ),
        ProxyProvider<PreferenceService, TopHeadlinesStore>(
          update: (_, preferenceService, __) => TopHeadlinesStore(TopHeadlinesService(), preferenceService),
        ),
        ProxyProvider<PreferenceService, HomeScreenStore>(
          update: (_, preferenceService, __) => HomeScreenStore(preferenceService),
        )
      ],
      child: Consumer<AppStore>(
        builder: (context, appStore, _) {
          return Observer(
            builder: (_) => MaterialApp(
              // TODO: Missing system preference
              theme: appStore.useDarkMode
                  ? appStore.usePitchBlack ? Themes.pitchBlack : Themes.darkTheme
                  : Themes.lightTheme,
              home: (appStore.apiKey == null || appStore.apiKey.isEmpty) ? SetupScreen() : HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}
