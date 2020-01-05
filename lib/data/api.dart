import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:News/data/model/everything.dart';
import 'package:News/data/model/sources.dart';
import 'package:News/data/model/top_headlines.dart';

import 'model/api_error.dart';

// Base URL
const String _baseApiURL = 'newsapi.org';

// API Endpoints
const String _topHeadlines = '/v2/top-headlines';
const String _everything = '/v2/everything';
const String _sources = '/v2/sources';

// Parameter values
enum Country {
  ae,
  ar,
  at,
  au,
  be,
  bg,
  br,
  ca,
  ch,
  cn,
  co,
  cu,
  cz,
  de,
  eg,
  fr,
  gb,
  gr,
  hk,
  hu,
  id,
  ie,
  il,
  ind, //'in' is a keyword, translate to 'in' string during runtime
  it,
  jp,
  kr,
  lt,
  lv,
  ma,
  mx,
  my,
  ng,
  nl,
  no,
  nz,
  ph,
  pl,
  pt,
  ro,
  rs,
  ru,
  sa,
  se,
  sg,
  si,
  sk,
  th,
  tr,
  tw,
  ua,
  us,
  ve,
  za,
}

enum NewsCategory {
  business,
  entertainment,
  general,
  health,
  science,
  sports,
  technology,
}

enum NewsLanguage { ar, de, en, es, fr, he, it, nl, no, pt, ru, se, ud, zh }

enum SortBy { relevancy, popularity, publishedAt }

String _getCountryCode(Country country) {
  if (null == country) return null;
  if (country == Country.ind)
    return 'in';
  else
    return country.toString();
}

Future<TopHeadlines> getTopHeadlines(String apiKey,
    {Country country = Country.ind, NewsCategory category, String q, int pageSize, int page}) async {
  final Map<String, String> queryParams = _filterNullOrEmptyValuesFromMap({
    'country': _getCountryCode(country),
    'category': category?.toString(),
    'query': q,
    'pageSize': pageSize?.toString(),
    'page': page?.toString(),
  });
  final Uri uri = Uri.https(_baseApiURL, _topHeadlines, queryParams);
  final http.Response response = await http.get(uri, headers: {
    HttpHeaders.authorizationHeader: 'Bearer $apiKey',
  });
  // If response is not ok
  _checkResponse(response);
  // Deserialize
  try {
    return TopHeadlines.fromJson(json.decode(response.body));
  } on Exception catch (e) {
    throw e;
  }
}

Future<TopHeadlines> getTopHeadlinesFromSources(String apiKey, String sources,
    {String q, int pageSize, int page}) async {
  final Map<String, String> queryParams = _filterNullOrEmptyValuesFromMap({
    'query': q,
    'pageSize': pageSize?.toString(),
    'page': page?.toString(),
  });
  final Uri uri = Uri.https(_baseApiURL, _topHeadlines, queryParams);
  final http.Response response = await http.get(uri, headers: {
    HttpHeaders.authorizationHeader: 'Bearer $apiKey',
  });
  // If response is not ok
  _checkResponse(response);
  // Deserialize
  try {
    return TopHeadlines.fromJson(json.decode(response.body));
  } on Exception catch (e) {
    throw e;
  }
}

Future<Everything> getEverything(
  String apiKey, {
  String q,
  String qInTitle,
  String sources,
  String domains,
  String excludeDomains,
  DateTime from,
  DateTime to,
  NewsLanguage language,
  SortBy sortBy,
  int pageSize,
  int page,
}) async {
  final Map<String, String> queryParams = _filterNullOrEmptyValuesFromMap({
    'query': q,
    'qInTitle': qInTitle,
    'sources': sources,
    'domains': domains,
    'excludeDomains': excludeDomains,
    'from': from.toIso8601String(),
    'to': to?.toIso8601String(),
    'language': language?.toString(),
    'sortBy': sortBy?.toString(),
    'pageSize': pageSize?.toString(),
    'page': page?.toString(),
  });
  final Uri uri = Uri.https(_baseApiURL, _everything, queryParams);
  final http.Response response = await http.get(uri, headers: {
    HttpHeaders.authorizationHeader: 'Bearer $apiKey',
  });
  // If response is not ok
  _checkResponse(response);
  // Deserialize
  try {
    return Everything.fromJson(json.decode(response.body));
  } on Exception catch (e) {
    throw e;
  }
}

Future<Sources> getSources(String apiKey, {NewsCategory category, NewsLanguage language, Country country}) async {
  final Map<String, String> queryParams = _filterNullOrEmptyValuesFromMap({
    'country': _getCountryCode(country),
    'category': category?.toString(),
    'language': language?.toString(),
  });
  final Uri uri = Uri.https(_baseApiURL, _sources, queryParams);
  final http.Response response = await http.get(uri, headers: {
    HttpHeaders.authorizationHeader: 'Bearer $apiKey',
  });
  // If response is not ok
  _checkResponse(response);
  // Deserialize
  try {
    return Sources.fromJson(json.decode(response.body));
  } on Exception catch (e) {
    throw e;
  }
}

Map<String, String> _filterNullOrEmptyValuesFromMap(Map<String, String> map) {
  final Map<String, String> filteredMap = <String, String>{};
  map.forEach((String key, String value) {
    if (value != null && value.isNotEmpty) filteredMap[key] = value;
  });
  return filteredMap;
}

_checkResponse(http.Response response) {
  if (response.statusCode != 200) {
    // Try to build api_error object
    try {
      final APIError apiError = APIError.fromJson(json.decode(response.body));
      throw apiError;
    } on Exception catch (e) {
      // Rethrow
      if (e is APIError)
        throw e;
      else // Deserialization error
        throw Exception(response.body);
    }
  }
}
