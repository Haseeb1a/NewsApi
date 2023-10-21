// import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/helpes/function.dart';
import 'package:newsapp/model/articalemodel.dart';
import 'package:newsapp/model/catogarymodel.dart';
import 'package:newsapp/services/newsconnection.dart';
import 'package:newsapp/view/articlepage.dart';

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
                style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
              ),
              Text(
                'MATRIX',
                style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),
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

class CetotgoryTile extends StatelessWidget {
  final Categoryname;
  final Categoryimg;
  const CetotgoryTile({this.Categoryimg, this.Categoryname});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ArticleView(),
        ));
      },
      //  onTap: () {
      //     Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context) => CateogryNews(
      //         category: categoryName.toLowerCase(),
      //       ),
      //     ));
      child: Container(
        height: 70,
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: Categoryimg,
                width: 120,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Container(
                alignment: Alignment.center,
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.black26),
                child: Text(
                  Categoryname,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final imageUrl, title, desc, Url;
  BlogTile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.desc,
      required this.Url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleView(
                blogUrl: Url,
              ),
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl ?? "Not Found")),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              desc ?? "Not Found",
              style: const TextStyle(color: Color.fromARGB(123, 51, 46, 46)),
            )
          ],
        ),
      ),
    );
  }
}