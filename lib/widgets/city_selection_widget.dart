import 'package:flutter/material.dart';

class CitySelectionWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CitySelectionWidgetState();
}

class _CitySelectionWidgetState extends State<CitySelectionWidget> {

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text('City')),
      body: Form(
          child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: TextFormField(
                controller: _textController,
                decoration:
                    InputDecoration(labelText: 'City', hintText: 'Paris'),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => Navigator.pop(context, _textController.text),
          )
        ],
      )));
}
