// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:newsapp/helpes/function.dart';
import 'package:newsapp/model/articalemodel.dart';
import 'package:newsapp/model/catogarymodel.dart';
import 'package:newsapp/services/newsconnection.dart';
import 'package:newsapp/view/homepage/widget/tiles.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<CategoryModel> categoriess = <CategoryModel>[];

  List<Atrticlemodel> articles = <Atrticlemodel>[];
  bool _loading = true;

  getNews() async {
    News newsServices = News();
    await newsServices.getNews();
    articles = newsServices.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoriess = articalelist;
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'INFO ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'MATRIX',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ListView.builder(
                            // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CetotgoryTile(
                                Categoryimg: categoriess[index].categoryimage,
                                Categoryname: categoriess[index].categortname,
                              );
                            },
                            itemCount: categoriess.length,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 16),
                        child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return BlogTile(
                              imageUrl: articles[index].urltoimage.toString(),
                              title: articles[index].title.toString(),
                              desc: articles[index].desription.toString(),
                              Url: articles[index].url.toString(),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

