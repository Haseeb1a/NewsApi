// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:newsapp/controller/homepagecontroller.dart';
import 'package:newsapp/view/homepage/widget/tiles.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    final Homedata  = Provider.of<HomeController>(context);
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
      body: Homedata.loading
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
                                Categoryimg:Homedata. categoriess[index].categoryimage,
                                Categoryname: Homedata.categoriess[index].categortname,
                              );
                            },
                            itemCount:Homedata. categoriess.length,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 16),
                        child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: Homedata.articles.length,
                          itemBuilder: (context, index) {
                            return BlogTile(
                              imageUrl: Homedata.articles[index].urltoimage.toString(),
                              title: Homedata.articles[index].title.toString(),
                              desc: Homedata.articles[index].desription.toString(),
                              Url: Homedata.articles[index].url.toString(),
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
