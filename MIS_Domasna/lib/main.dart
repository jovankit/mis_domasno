import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mis_domasna/Post.dart';
import 'package:mis_domasna/camera.dart';
import 'package:mis_domasna/compass.dart';
import 'card.dart';
import 'form.dart';

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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _counter = 0;
  List<MyCard> _cards = [];
  late TabController _tabController=TabController(vsync: this, length: 2);

  @override
  void initState() {
    super.initState();
    makeGetRequest();
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging && _tabController.index==1) {
      makeGetRequest();

      print("here");
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _mainPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => MyFormPage()));
  }

  void _mirror(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => Camera()));
  }

  @override
  Widget build(BuildContext context) {
    _cards.sort((a, b) => a.votes.compareTo(b.votes));
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: 'Fun Compass'),
                Tab(text: 'Jokes'),
              ],
            ),
            title: Text('Happyplace'),
            actions: [
              FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {
                  _mirror(context);
                },
                tooltip: 'Post',
                child: const Text('Mirror'),
              )
            ],
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              Container(
                color: Colors.blue,
                child: Compass(),
              ),
              Container(
                color: Colors.blue,
                child: Center(child: ListView(children: _cards)),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              _mainPage(context);
            },
            tooltip: 'Post',
            child: const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text('Share Joke'),
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }

  Future<void> makeGetRequest() async {
    List<MyCard> cards = [];
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8082/api/posts'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      List posts = json.decode(response.body);

      for (var element in posts) {
        cards
            .add(MyCard(id: 1, text: element['text'], votes: element["votes"]));
      }
      _cards=cards;
      setState(() {});
    } else {
      // If the server returns an error, throw an exception.
      throw Exception('Failed to load data');
    }
  }
}
