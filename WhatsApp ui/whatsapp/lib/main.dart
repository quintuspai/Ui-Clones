import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/ui/home_screen_ui.dart';

List<CameraDescription> cameras;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColor: Color(0xff25D366),
        primaryColor: Color(0xff075E54),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WhatsAppHomePage(),
    );
  }
}

