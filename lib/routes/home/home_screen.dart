import 'package:News/routes/home/pages/topheadlines/logic/top_headlines_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'pages/settings/settings_store.dart';
import 'logic/home_screen_store.dart';
import 'pages/pages.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget _buildEverythingPage() {
    return EverythingPage();
  }

  Widget _buildFavouritesPage() {
    return FavouritesPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Center(
          child: Observer(builder: (_) {
            switch (Provider.of<HomeScreenStore>(context).selectedPage) {
              case 0:
                return Consumer<TopHeadlinesStore>(
                  builder: (context, headlinesStore, _) => Material(
                    child: TopHeadlinesPage(headlinesStore),
                  ),
                );
                break;
              case 1:
                return _buildEverythingPage();
                break;
              case 2:
                return _buildFavouritesPage();
                break;
              case 3:
                return Consumer<SettingsStore>(
                  builder: (context, settingsStore, _) => Material(
                    child: SettingsPage(settingsStore),
                  ),
                );
                break;
            }
            return null;
          }),
        ),
      ),
      bottomNavigationBar: Observer(
        builder: (_) => BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Theme.of(context).backgroundColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.bolt),
              title: Text('Top Headlines'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.globe),
              title: Text('Everything'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.solidHeart),
              title: Text('Favourites'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.cog),
              title: Text('Settings'),
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: Provider.of<HomeScreenStore>(context).selectedPage,
          onTap: Provider.of<HomeScreenStore>(context).setPage,
        ),
      ),
    );
  }
}
