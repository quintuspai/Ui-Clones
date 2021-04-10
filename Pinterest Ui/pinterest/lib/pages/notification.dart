import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget{
  NotificationPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text("Notification Page",
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    );
  }
}