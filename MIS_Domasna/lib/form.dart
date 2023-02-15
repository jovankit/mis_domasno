import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyFormPage extends StatefulWidget {
  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  late String _text;

  void save() {
  }

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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _text = value!;
                  });
                  createPost();
                },
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                      child: Text('Share'),
                      onPressed: null))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> createPost() async {
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8082/api/posts'),
        body: {
          'text': _text,
        }
    );

    if (response.statusCode == 201) {
      print('Post created successfully.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
