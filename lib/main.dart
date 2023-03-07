import 'package:blocstudy/data/providers/news_providers.dart';
import 'package:blocstudy/data/repositories/implementation/news_repository.dart';
import 'package:blocstudy/data/repositories/news_repository.dart';
import 'package:blocstudy/presentation/pages/news_screen/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final newsProvider = NewsProvider();
  final newsRepository = NewsRepository(newsProvider);
  
  runApp(RepositoryProvider<NewsRepositoryBase>(
     
      create: (_) => newsRepository, child: MyApp(),
       ));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewsScreen.create(context),
    );
  }
}
