import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget{
  SearchPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text("Search Page",
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    );
  }
}