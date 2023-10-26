import 'package:flutter/material.dart';

import '../helpes/function.dart';
import '../model/articalemodel.dart';
import '../model/catogarymodel.dart';
import '../services/newsconnection.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
     categoriess = articalelist;
     
    getNews();
  }
  List<CategoryModel> categoriess = <CategoryModel>[];

  List<Atrticlemodel> articles = <Atrticlemodel>[];
  bool loading = true;
  getNews() async {
    News newsServices = News();
    await newsServices.getNews();
    articles = newsServices.news;

    loading = false;
    notifyListeners();
  }

  
}
