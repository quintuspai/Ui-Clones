import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatInfoPage extends StatelessWidget{
  final String avatarUrl, name;

  ChatInfoPage(this.avatarUrl, this.name);
  @override
  Widget build(BuildContext context) {
    var _value = true;
    List _widgetList = [
      Icon(Icons.message, color: Theme.of(context).primaryColor,),
      Icon(Icons.phone, color: Theme.of(context).primaryColor,),
      Icon(Icons.videocam, color: Theme.of(context).primaryColor,),
    ];

    // TODO: implement build
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool flag) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 250.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  background: Image.network(avatarUrl, fit: BoxFit.cover,),
                ),
                actions: [
                  PopupMenuButton(
                      onSelected: choiceAction,
                      itemBuilder: (BuildContext context) {
                        return Constants.choices.map((String choice) {
                          return PopupMenuItem<String>(
                            child: Text(choice),
                            value: choice,
                          );
                        }).toList();
                      }
                  ),
                ],
              )
            ];
          },
        body: Container(
          color: Color(0xfff2f2f2),
          child: ListView(
            children: [
              Container(
                color: Colors.white,
                child: Card(
                  elevation: 0.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 10.0),
                          child: Text(
                            "Media, links, and docs",
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 18.0
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for(int i = 0; i < 9; i++)
                                mediaUi()
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('Mute notifications',style: TextStyle(color: Colors.black, fontSize: 18),),
                        subtitle: Text('Until July 29',style: TextStyle(color: Theme.of(context).hintColor),),
                        trailing: Switch(
                            activeColor: Theme.of(context).primaryColor,
                            inactiveTrackColor: Colors.grey,
                            inactiveThumbColor: Colors.grey,
                            activeTrackColor: Theme.of(context).primaryColor,
                            value: _value,
                            onChanged: (value){
                              _value = value;
                            }
                        )
                      ),
                      Divider(
                        color: Color(0xfff2f2f2),
                        thickness: 4.0,
                      ),
                      ListTile(
                          title: Text('Custom notifications',style: TextStyle(color: Colors.black, fontSize: 18),),
                          ),
                      Divider(
                        color: Color(0xfff2f2f2),
                        thickness: 4.0,
                      ),
                      ListTile(
                        title: Text('Media visibility',style: TextStyle(color: Colors.black, fontSize: 18),),
                      ),
                      Divider(
                        color: Color(0xfff2f2f2),
                        thickness: 4.0,
                      ),
                      ListTile(
                        title: Text('Encryption',style: TextStyle(color: Colors.black, fontSize: 18),),
                        subtitle: Text("Messages to this chat and calls are secured with end-to-end encryption. Tap to verify."),
                        trailing: Icon(Icons.lock,color: Theme.of(context).primaryColor,),
                      ),
                      Divider(
                        color: Color(0xfff2f2f2),
                        thickness: 12.0,
                      ),
                      Container(
                        color: Colors.white,
                        child: Card(
                          elevation: 0.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0, left: 10.0),
                                child: Text(
                                  "Phone number",
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: 18.0
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text("+91 01234 56789", style: TextStyle(color: Colors.black, fontSize: 18.0),),
                                subtitle: Text('Mobile'),
                                trailing: Wrap(
                                  spacing: 12,
                                  children: [
                                    Icon(Icons.message, color: Theme.of(context).primaryColor,),
                                    Icon(Icons.phone, color: Theme.of(context).primaryColor,),
                                    Icon(Icons.videocam, color: Theme.of(context).primaryColor,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: Color(0xfff2f2f2),
                        thickness: 12.0,
                      ),
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          leading: Icon(Icons.block,color: Colors.red,),
                          title: Text("Block",style: TextStyle(color: Colors.red),),
                        ),
                      ),
                      Divider(
                        color: Color(0xfff2f2f2),
                        thickness: 12.0,
                      ),
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          leading: Icon(Icons.thumb_down,color: Colors.red,),
                          title: Text("Report Contact",style: TextStyle(color: Colors.red),),
                        ),
                      )
                    ],
                  )
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  Widget mediaUi() {
    return Padding(
      padding: const EdgeInsets.only(left:8.0),
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(avatarUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

void choiceAction(String choice) {
  print(choice);
}

class Constants {
  static const String Share = "Share";
  static const String Edit = "Edit";
  static const String AddressBook = "View in address book";
  static const String SecurityCode = "Verify security code";

  static const List<String> choices = <String>[Share, Edit, AddressBook, SecurityCode];
}
