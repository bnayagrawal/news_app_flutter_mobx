import 'package:News/data/api.dart';

const String _flagAssetDirectory = 'assets/images/flags/';
const String _flagImageExtension = '.png';

// Get country flag asset path
String getFlagAssetPathForCountry(Country country) {
  String countryCode = (country == Country.ind) ? 'in' : country.toString().split('.').last;
  return _flagAssetDirectory + countryCode + _flagImageExtension;
}

const Map<Country, String> countryNameByCode = {
  Country.ar: 'Argentina',
  Country.au: 'Australia',
  Country.at: 'Austria',
  Country.be: 'Belgium',
  Country.br: 'Brazil',
  Country.bg: 'Bulgaria',
  Country.ca: 'Canada',
  Country.cn: 'China',
  Country.co: 'Colombia',
  Country.cu: 'Cuba',
  Country.cz: 'Czech Republic',
  Country.eg: 'Egypt',
  Country.fr: 'France',
  Country.de: 'Germany',
  Country.gr: 'Greece',
  Country.hk: 'Hong Kong',
  Country.hu: 'Hungary',
  Country.ind: 'India',
  Country.id: 'Indonesia',
  Country.ie: 'Ireland',
  Country.il: 'Israel',
  Country.it: 'Italy',
  Country.jp: 'Japan',
  Country.lv: 'Latvia',
  Country.lt: 'Lithuania',
  Country.my: 'Malaysia',
  Country.mx: 'Mexico',
  Country.ma: 'Morocco',
  Country.nl: 'Netherlands',
  Country.nz: 'New Zealand',
  Country.ng: 'Nigeria',
  Country.no: 'Norway',
  Country.ph: 'Philippines',
  Country.pl: 'Poland',
  Country.pt: 'Portugal',
  Country.ro: 'Romania',
  Country.ru: 'Russia',
  Country.sa: 'Saudi Arabia',
  Country.rs: 'Serbia',
  Country.sg: 'Singapore',
  Country.sk: 'Slovakia',
  Country.si: 'Slovenia',
  Country.za: 'South Africa',
  Country.kr: 'South Korea',
  Country.se: 'Sweden',
  Country.ch: 'Switzerland',
  Country.tw: 'Taiwan',
  Country.tr: 'Turkey',
  Country.ae: 'UAE',
  Country.gb: 'United Kingdom',
  Country.us: 'United States',
  Country.ve: 'Venuzuela',
};
