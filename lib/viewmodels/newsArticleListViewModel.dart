import 'package:flutter/cupertino.dart';
import 'package:noticias/models/newsArticle.dart';
import 'package:noticias/services/webservise.dart';
import 'package:noticias/viewmodels/newsArticleViewModel.dart';

class NewsArticleListViewModel extends ChangeNotifier {
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  void populateTopHeadlines() async {
    List<NewsArticle> newsArticles = await Webservice().fetchTopHeadLines();
    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    notifyListeners();
  }
}
