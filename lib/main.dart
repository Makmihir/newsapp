
import 'package:flutter/material.dart';
import 'package:newsapi/service/apiService.dart';

import 'model/article.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: FutureBuilder(
        future: ApiService().getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(itemCount: snapshot.data!.length,
                                    itemBuilder:(BuildContext context, index){
                                    return Card(
                                          elevation:4,
                                          child:Column(
                                            children: [
                                              //image
                                              // title
                                              // desc-2 line
                                              Text('${snapshot.data![index].urlToImage}'),
                                              Text('${snapshot.data![index].title}', style: TextStyle(fontSize: 22)),
                                              //Text('${snapshot.data![index].author}'),
                                              Text('${snapshot.data![index].description}'),
                                              //Text('${snapshot.data![index].publishedAt}'),


                                            ],

                                          ),
                                      );


            }
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}