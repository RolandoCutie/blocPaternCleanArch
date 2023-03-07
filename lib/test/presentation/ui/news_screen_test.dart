import 'package:blocstudy/data/models/article.dart';
import 'package:blocstudy/test/presentation/bloc/news_cubit_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  final article = Article(title: "Tutorial 1", author: "Yayo");
  final article2 = Article(title: "Tutorial 1", author: "Yayo");

  final mockRepo = MockNewsRepositoryBase();

  setUp(() {
    when(mockRepo.topHeadLines(any))
        .thenAnswer((_) async => [article, article2]);
  });

  //TODO:WIDGET TEST
  testWidgets("News screen  loads correctly", (WidgetTester tester) async {
    expect(1, 1);
  });
}
