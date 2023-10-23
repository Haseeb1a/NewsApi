// https://newsapi.org/v2/everything?q=tesla&from=2023-09-20&sortBy=publishedAt&apiKey=808b40238c2345d697e60ded621869bc

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp/helpes/function.dart';
import 'package:newsapp/model/articalemodel.dart';
import 'package:http/http.dart' as http;

class News {
  List<Atrticlemodel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=808b40238c2345d697e60ded621869bc";
       var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Atrticlemodel articleModel = Atrticlemodel(
            title: element['title'],
            author: element['author'],
            desription: element['description'],
            url: element['url'],
            urltoimage: element['urlToImage'],
            content: element['context'],
          );
          news.add(articleModel);
        }
      });
    }
      }
    }

