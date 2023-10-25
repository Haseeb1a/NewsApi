import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/controller/articlecontroller.dart';
import 'package:newsapp/controller/homepagecontroller.dart';
import 'package:newsapp/view/homepage/homepage.dart';
import 'package:provider/provider.dart';

import 'controller/categorycontroller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>HomeController()),
        ChangeNotifierProvider(create: (context)=>CategoryController()),
        ChangeNotifierProvider(create: (context)=>ArticleController()),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const Homepage(),
      ),
    );
  }
}

