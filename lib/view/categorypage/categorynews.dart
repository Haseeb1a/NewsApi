
import 'package:flutter/material.dart';
import 'package:newsapp/model/articalemodel.dart';
import '../../services/categorynews.dart';
import '../homepage/widget/tiles.dart';
class CatrgoryNews extends StatefulWidget {
  final String catogory;
  CatrgoryNews({required this.catogory});

  @override
  State<CatrgoryNews> createState() => _CatrgoryNewsState();
}

class _CatrgoryNewsState extends State<CatrgoryNews> {
  List<Atrticlemodel> articles = [];
  bool _loading = true;
  getcategoryNews() async {
    NewsCategoty newsServices = NewsCategoty();
    await newsServices.getNewsCategoty(widget.catogory);
    articles = newsServices.newsCategoty;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    
    getcategoryNews();
    // TODO: implement initState
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
                ])),
              ));
  }
}
