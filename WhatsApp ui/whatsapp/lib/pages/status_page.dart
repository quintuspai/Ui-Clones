import 'package:flutter/material.dart';
import 'package:whatsapp/pages/story_page.dart';

class StatusPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color(0xfff2f2f2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: Colors.white,
            elevation: 0.0,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage("https://s3.amazonaws.com/wll-community-production/images/no-avatar.png"),
                      ),
                      Positioned(
                          bottom: 0.0,
                          right: 1.0,
                          child: Container(
                            height: 20,
                            width: 20,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 15,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ),
                    ],
                  ),
                  title: Text("Status",style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text("Tap to add status"),
                ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Viewed Updates",style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
          ),
          Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child: ListView(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/flutterintro-3a3f4.appspot.com/o/IMG-20200126-WA0000_2.jpg?alt=media&token=d23e6fb3-223d-4cba-8666-2f44974ec315"),
                      ),
                      title: Text("Quintus Pai",style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Text('Today, 12.09 PM'),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => StoryViewPage())),
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}