import 'package:flutter/material.dart';

import '../model/articalemodel.dart';
import '../services/categorynews.dart';

class  CategoryController extends ChangeNotifier {
  //  final String catogory;
    List<Atrticlemodel> articles = [];
  bool loading = true;
 Future<void> fetchCategoryNews(String category) async {
    NewsCategoty newsServices = NewsCategoty();
    await newsServices.getNewsCategoty(category);
    articles = newsServices.newsCategoty;
    loading = false;
    notifyListeners();
  }
  
  
}