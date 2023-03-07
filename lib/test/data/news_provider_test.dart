import 'dart:io';

import 'package:blocstudy/data/providers/news_providers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

//Todo:Test para el provider

void main() {
  test('Top headline response is correct', () async {
    final provider = _getProvider('lib/test/data/top_headlines.json');
    final articles = await provider.topHeadLines('US');

    expect(articles.length, 2);
    expect(articles[0].author, 'businessinsider.com');
  });


  //Para testear el api key missing exception
  test('Api key missing exception', () async {
    final provider = _getProvider('lib/test/data/api_key_missing.json');

    expect(provider.topHeadLines("US"),
        throwsA(predicate((exception) => exception is MissingApiKeyException)));

  });

  //Para testear el apikey invalid
  test('Api key invalid exception', () async {
    final provider = _getProvider('lib/test/data/api_key_invalid.json');

    expect(provider.topHeadLines("US"),
        throwsA(predicate((exception) => exception is ApiKeyInvalidException)));

  });
}
//Creacion de un newsProviders

NewsProvider _getProvider(String filePath) =>
    NewsProvider(httpClient: _getMockProvider(filePath));

//Creacion de un mock para poder hacer las pruebas
MockClient _getMockProvider(String filePath) => MockClient((_) async =>
    Response(await File(filePath).readAsString(), 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    }));
