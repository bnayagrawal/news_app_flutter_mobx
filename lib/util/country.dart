import 'package:News/data/api.dart';

const String _flagAssetDirectory = 'assets/images/flags/';
const String _flagImageExtension = '.png';

// Get country flag asset path
String getFlagAssetPathForCountry(Country country) {
  String countryCode = (country == Country.ind) ? 'in' : country.toString();
  return _flagAssetDirectory + countryCode + _flagImageExtension;
}