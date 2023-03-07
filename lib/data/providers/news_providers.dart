import 'dart:convert';

import 'package:blocstudy/data/models/api_response.dart';
import 'package:blocstudy/data/models/article.dart';
import 'package:http/http.dart' as http;
//TODO:Clase encargada de realizar las peticiones a la api rest


class NewsProvider {
  static const String _apiKey = '369086c79cf546e49abb4553e3ba165c';
  static const String _baseUrl = 'newsapi.org';

  //Endpoints
  static const String _topHeadlines = '/v2/top-headlines';

  final http.Client _httpClient;

  //Creacion del constructor con la http cl;ient pasandola pues esto luego se usara para
  //poder hacer los testing
  NewsProvider({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  //Creacion de una funcion para mandar a llamar la api
  Future<ApiResponse> _callGetAPi({
    required String endpoint,
    required Map<String, String> parameters,
  }) async {
    //Aqui conformamos la url para la peticion
    var uri = Uri.https(_baseUrl, endpoint, parameters);

    //Esta seria la respuesta que obtenemos
    final response = await _httpClient.get(uri);

    //Esta es la respuesta cuando le aplicamos el metodo fromJson
    final result = ApiResponse.fromJson(json.decode(response.body));

    if (result.status == 'error') {
      //Se valida el error para saber que excepcion se manda
      if (result.code == 'apiKeyMissing') throw MissingApiKeyException();
      if (result.code == 'apiKeyInvalid') throw ApiKeyInvalidException();

      throw Exception(result.message);
    }

    return result;
  }

  //Funcion para solicitar de la api TODOS LOS articulkos
  Future<List<Article>> topHeadLines(String sources,) async {
    final result = await _callGetAPi(
      endpoint: _topHeadlines,
      parameters: {'sources': sources, 'apiKey': _apiKey},
    );

    return result.articles!;
  }
}

//TODO:Creamos dos excepciones

class MissingApiKeyException implements Exception {}

class ApiKeyInvalidException implements Exception {}
