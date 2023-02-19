import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyFormPage extends StatefulWidget {
  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Post'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Text / Joke'),
                onChanged: (value) {
                  setState(() {
                    _text = value;
                  });
                },
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                      onPressed: () {
                        createPost();
                      },
                      child: Text("Share")))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> createPost() async {
    final response =
        await http.post(Uri.parse('http://10.0.2.2:8082/api/posts?text=$_text'));

    if (response.statusCode == 201) {
      print('Post created successfully.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
