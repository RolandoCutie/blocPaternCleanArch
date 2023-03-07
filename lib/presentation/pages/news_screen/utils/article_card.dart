import 'package:blocstudy/data/models/article.dart';
import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //Navigate next screen

      },
      child: Card(
        child: Column(
          children: [
            article.urlToImage == null
                ? Container(
                    color: Colors.red,
                    height: 250,
                  )
                : Image.network(article.urlToImage!),
            Text(
              article.title,
              maxLines: 1,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              article.description ?? '',
              maxLines: 3,
            ),
            SizedBox(
              height: 16,
            ),

          ],
        ),
      ),
    );
  }
}
