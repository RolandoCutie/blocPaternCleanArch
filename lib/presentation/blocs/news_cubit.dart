import 'package:bloc/bloc.dart';
import 'package:blocstudy/data/models/article.dart';
import 'package:blocstudy/data/providers/news_providers.dart';
import 'package:blocstudy/data/repositories/implementation/news_repository.dart';
import 'package:blocstudy/data/repositories/news_repository.dart';
import 'package:equatable/equatable.dart';

part 'news_state.dart';

//TODO:Clase cubit principal
class NewsCubit extends Cubit<NewsState> {
  //Aqui traemos el repositorio
  final NewsRepositoryBase _repositoryBase;

  //Funciones del cubit
  Future<void> loadTopNews({String sources='techcrunch'}) async {
    try {
      emit(NewsLoadingState());

      final news = await _repositoryBase.topHeadLines(sources);

      emit(NewsLoadCompleteState(news));
    } on Exception catch (e) {
      if (e is MissingApiKeyException) {
        emit(NewsErrorState("Please check the api Key"));
      } else if (e is ApiKeyInvalidException) {
        emit(NewsErrorState("The Api key is invalid"));
      } else {
        emit(NewsErrorState("Unknow error"));
      }
    }
  }

  NewsCubit(this._repositoryBase) : super(NewsInitialState());
}
