// import 'dart:ffi';

import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:mis_domasna/Post.dart';
import 'package:mis_domasna/compass.dart';
import 'card.dart';
import 'form.dart';
import 'funnyCompass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Post> posts=[Post(text: 'Test', votes: 24, id: 1),Post(text: 'Test', votes: 24, id: 1),Post(text: 'Test', votes: 24, id: 1)];
  List<MyCard> cards=[];
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _mainPage(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>MyFormPage()));
  }

  @override
  Widget build(BuildContext context) {
    posts.forEach((element) {
      cards.add(MyCard(id: 1, text: element.text, votes: element.votes));
    });
    cards.sort((a, b) => a.votes.compareTo(b.votes));
    // makeGetRequest();
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: 'Fun Compass'),
                Tab(text: 'Jokes'),
              ],
            ),
            title: Text('Happyplace'),
          ),
          body: TabBarView(
            children: [
              Container(
                color:Colors.blue,
                child: Compass1(),
              ),
              Container(
                color: Colors.blue,
                child: Center(
                  child: ListView(children: cards)
                  // [
                  //   Card(
                  //     child: MyCard(),
                  //   )
                  // ]
                  ),
                ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _mainPage(context);
            },
            tooltip: 'Post',
            child: const Text('Share Joke'),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}

// Future<void> makeGetRequest() async {
//   final response = await http.get('http://localhost:8082/api/posts');
//
//   if (response.statusCode == 200) {
//     // If the server returns a 200 OK response, parse the JSON.
//     List posts = json.decode(response.body);
//     print("here");
//     print(posts);
//   } else {
//     // If the server returns an error, throw an exception.
//     throw Exception('Failed to load data');
//   }
// }
