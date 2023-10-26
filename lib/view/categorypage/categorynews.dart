import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/controller/categorycontroller.dart';
import 'package:newsapp/model/articalemodel.dart';
import 'package:provider/provider.dart';
import '../../services/categorynews.dart';
import '../homepage/widget/tiles.dart';

class CatrgoryNews extends StatefulWidget {
  final String catogory;
  CatrgoryNews({required this.catogory});

  @override
  State<CatrgoryNews> createState() => _CatrgoryNewsState();
}

class _CatrgoryNewsState extends State<CatrgoryNews> {
  // List<Atrticlemodel> articles = [];
  // bool _loading = true;
  // getcategoryNews() async {
  //   NewsCategoty newsServices = NewsCategoty();
  //   await newsServices.getNewsCategoty(widget.catogory);
  //   articles = newsServices.newsCategoty;
  //   setState(() {
  //     _loading = false;
  //   });
  // }
  @override
  void initState() {
    final Categorydata =
        Provider.of<CategoryController>(context, listen: false);
    // TODO: implement initState
    super.initState();
    Categorydata.fetchCategoryNews(widget.catogory);
  }

  @override
  Widget build(BuildContext context) {
    final Categorydata =
        Provider.of<CategoryController>(context, listen: false);
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
        body: Categorydata.loading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                    child: Column(children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 16),
                          child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: Categorydata.articles.length,
                            itemBuilder: (context, index) {
                              return BlogTile(
                                imageUrl: Categorydata.articles[index].urltoimage.toString(),
                                title: Categorydata.articles[index].title.toString(),
                                desc: Categorydata.articles[index].desription.toString(),
                                Url: Categorydata.articles[index].url.toString(),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ])),
              ));
  }
}
