import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget{
  AccountPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text("Account Page",
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    );
  }
}