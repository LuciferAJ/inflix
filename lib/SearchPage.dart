import 'package:flutter/material.dart';

class Search_bar extends StatefulWidget {
  @override
  _Search_barState createState() => _Search_barState();
}

class _Search_barState extends State<Search_bar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xff192b44),
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){Navigator.pop(context);}),
      ),
      body: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter a search term'
        ),
      ),
    );
  }
}
