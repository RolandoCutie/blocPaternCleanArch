import 'package:blocstudy/data/models/article.dart';
import 'package:blocstudy/data/repositories/news_repository.dart';
import 'package:blocstudy/presentation/blocs/news_cubit.dart';
import 'package:blocstudy/test/presentation/bloc/news_cubit_test.mocks.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([NewsRepositoryBase])
void main() {
  group('Cubit test', () {
    final article = Article(title: 'Test', author: 'Yayo');
    final mockRepo = MockNewsRepositoryBase();

    blocTest<NewsCubit, NewsState>(
        'emits [] when nothing is called',
        build: () =>
            () {
          when(mockRepo.topHeadLines(any)).thenAnswer((_) async => [article]);
          return NewsCubit(mockRepo);
        },
        act: (cubit) async => cubit.loadTopNews();
        expected: ()
    =>
    [
      NewsLoadingState(),
      NewsLoadCompleteState(article)

    ]
    );


  });
}


