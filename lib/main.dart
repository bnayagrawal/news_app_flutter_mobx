import 'package:News/routes/home/logic/home_screen_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
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
                textTheme: TextTheme(
                  headline: GoogleFonts.raleway(fontWeight: FontWeight.w900, fontSize: 28),
                  title: GoogleFonts.raleway(fontWeight: FontWeight.w500, fontSize: 16),
                  subtitle: GoogleFonts.raleway(fontWeight: FontWeight.w500, fontSize: 11.5),
                  subhead: GoogleFonts.raleway(fontWeight: FontWeight.w700, fontSize: 20),
                  button: GoogleFonts.raleway(fontWeight: FontWeight.w900, fontSize: 14),
                  body1: GoogleFonts.raleway(fontWeight: FontWeight.w500, fontSize: 14),
                ),
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
