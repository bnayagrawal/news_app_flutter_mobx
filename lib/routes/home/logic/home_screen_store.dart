import 'package:News/common/preference_service.dart';
import 'package:News/routes/home/logic/home_screen_service.dart';
import 'package:mobx/mobx.dart';

part 'home_screen_store.g.dart';

class HomeScreenStore = _HomeScreenStore with _$HomeScreenStore;

abstract class _HomeScreenStore with Store {
  HomeScreenService _homeScreenService;

  _HomeScreenStore(PreferenceService preferenceService) {
    _homeScreenService = HomeScreenService(preferenceService);
  }

  @observable
  int selectedPage = 0;

  @action
  setPage(int pageIndex) {
    selectedPage = pageIndex;
  }
}
