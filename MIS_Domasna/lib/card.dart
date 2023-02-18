import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  final int id;
  final String text;
  final int votes;

  MyCard({required this.id, required this.text, required this.votes});

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyCard> {
  late final int id;
  late final String text;
  late final int votes;
  bool _isEnabled = true;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    text = widget.text;
    votes = widget.votes;
  }

  void _onPressed() {
    setState(() {
      _isEnabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: [
        Expanded(
          child:
              Padding(padding: EdgeInsets.only(left: 10.0), child: Text(text)),
        ),
        Text(votes.toString()),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_drop_up),
                onPressed: _isEnabled ? _onPressed : null,
              ),
              IconButton(
                icon: Icon(Icons.arrow_drop_down),
                onPressed: _isEnabled ? _onPressed : null,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
