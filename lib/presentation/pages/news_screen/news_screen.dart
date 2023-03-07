import 'package:blocstudy/data/repositories/news_repository.dart';
import 'package:blocstudy/presentation/blocs/news_cubit.dart';
import 'package:blocstudy/presentation/pages/news_screen/utils/article_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  static Widget create(BuildContext context) {
    return BlocProvider<NewsCubit>(
      create: (_) {
        final repository = context.read<NewsRepositoryBase>();
        return NewsCubit(repository)..loadTopNews();
      },
      child: NewsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Top News"),
        ),
        body: BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
          //TODO:Aqui es donde usamops el bloc builder y definimos que vamos a mostrar en funcion del estado
          if (state is NewsLoadingState) {
            return CircularProgressIndicator();
          } else if (state is NewsErrorState) {
            return Text(state.message);
          }
          final news = (state as NewsLoadCompleteState).news;
          return ListView.builder(
              itemCount: news.length,
              itemBuilder: (_, int index) {
                return ArticleCard(article: news[index]);
              });
        }));
  }
}
