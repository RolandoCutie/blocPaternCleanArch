import 'package:blocstudy/data/models/article.dart';

abstract class NewsRepositoryBase {
  Future<List<Article>> topHeadLines(String sources);
}
