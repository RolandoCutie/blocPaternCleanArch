import 'package:blocstudy/data/models/article.dart';
import 'package:blocstudy/data/providers/news_providers.dart';
import 'package:blocstudy/data/repositories/news_repository.dart';


//TODO:Clase repository que se encarga de hacer la conexion con la clase Provider
class NewsRepository extends NewsRepositoryBase {

  final NewsProvider _provider;

  NewsRepository(this._provider);

  //TODO:Aqui hacemos la solicitud al provider de los articulos
  @override
  Future<List<Article>> topHeadLines(String country) {
    return _provider.topHeadLines(country);
  }

}