import 'package:flutter/material.dart';
import 'package:noticias/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

class Newslist extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<Newslist> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
        appBar: AppBar(title: Text("Top News")),
        body: ListView.builder(
          itemCount: vm.articles.length,
          itemBuilder: (context, index) {
            final article = vm.articles[index];
            return ListTile(
              leading: Container(
                  width: 100,
                  height: 100,
                  child: article.imageURL == null
                      ? Image.asset("images/news.png")
                      : Image.network(article.imageURL)),
              title: Text(article.title),
            );
          },
        ));
  }
}
