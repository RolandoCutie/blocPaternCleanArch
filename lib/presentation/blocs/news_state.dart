part of 'news_cubit.dart';


//Estado del cubit base
abstract class NewsState extends Equatable {
  const NewsState();
}

//Estados del cubit que extienden de news State
class NewsInitialState extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoadingState extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoadCompleteState extends NewsState {

  final List<Article> news;

  NewsLoadCompleteState(this.news);

  @override
  List<Object> get props => [news];
}

class NewsErrorState extends NewsState {

  final String message;

  NewsErrorState(this.message);

  @override
  List<Object> get props => [message];
}