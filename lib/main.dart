import 'package:flutter/material.dart';
import 'package:noticias/pages/newsList.dart';
import 'package:noticias/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Fresh News",
        // ignore: missing_required_param
        home: ChangeNotifierProvider(
            builder: (context) => NewsArticleListViewModel(),
            child: Newslist()));
  }
}
