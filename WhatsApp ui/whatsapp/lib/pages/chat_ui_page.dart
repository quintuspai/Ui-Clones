import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/pages/chat_info_page.dart';

class ChatUiPage extends StatelessWidget {
  final String name, avatarUrl, message;
  ChatUiPage(this.name, this.avatarUrl, this.message);
  TextEditingController _messageController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  callback() {
    if (_messageController.text.length > 0) {
      _messageController.clear();
      _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFFECE5DD),
      appBar: AppBar(
        leading: SizedBox(
          width: double.infinity,
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Stack(
              overflow: Overflow.visible,
              alignment: Alignment.centerLeft,
              children: [
                Icon(Icons.arrow_back),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0, left: 25.0,bottom: 2.0),
                  child: CircleAvatar(
                    maxRadius: 17,
                    backgroundImage: NetworkImage(avatarUrl)
                  ),
                )
              ],
            ),
          ),
        ),
        title: InkWell(
          onTap: (){},
          highlightColor: Colors.grey,
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatInfoPage(avatarUrl, name,))
              );
            },
            child: Container(
              child: Padding(padding: EdgeInsets.all(8.0),
                child: Text(name),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.videocam, color: Colors.white,),
              onPressed: null,
          ),
          IconButton(
              icon: Icon(Icons.call, color: Colors.white,),
              onPressed: null,
          ),
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
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: ListView(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    receivedMessage(message),
                    sentMessage('Helllo'),
                  ],
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 8.0,
                              ),
                              Icon(Icons.insert_emoticon, color: Theme.of(context).hintColor,),
                              SizedBox(
                                width: 8.0,
                              ),
                              Expanded(
                                  child: TextField(
                                    enableInteractiveSelection: true,
                                    enableSuggestions: true,
                                    onSubmitted: (value) {
                                      sentMessage(value);
                                      callback();
                                    },
                                    textAlign: TextAlign.justify,
                                    autocorrect: true,
                                    controller: _messageController,
                                    decoration: InputDecoration(
                                      hintText: 'Type a message...',
                                      border: InputBorder.none,
                                    ),
                                  ),
                              ),
                              Icon(Icons.attach_file, color: Theme.of(context).hintColor,),
                              SizedBox(
                                width: 8.0,
                              ),
                              Icon(Icons.camera_alt, color: Theme.of(context).hintColor,),
                              SizedBox(
                                width: 8.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  SendButton(callback: callback,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget receivedMessage(String message) {
    final r = 2.5;
    final thread = ClipPath(
      clipper: ClipThread(r),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(r)),
        child: Container(
          padding: EdgeInsets.fromLTRB(8.0 + 2 * r, 8.0, 8.0, 8.0),
          color: Colors.white,
          child: Text('$message'),
        ),
      ),
    );
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8.0,
                ),
                thread,
              ],
            ),
          );

  }

}

class ClipThread extends CustomClipper<Path> {
  final double chatRadius;
  ClipThread(this.chatRadius);
  @override
  getClip(Size size) {
    // TODO: implement getClip
    final path = Path();
    path.lineTo(0.0, chatRadius);
    final r = chatRadius;
    final angle = 0.785;
    path.conicTo(
        r - r * sin(angle),
        r + r * cos(angle),
        r - r * sin(angle * 0.5),
        r + r * cos(angle * 0.5),
        1,
    );
    final moveIn = 2 * r;
    path.lineTo(moveIn, r + moveIn * tan(angle));
    path.lineTo(moveIn, size.height - chatRadius);
    path.conicTo(
      moveIn + r - r * cos(angle),
      size.height - r + r * sin(angle),
      moveIn + r,
      size.height,
      1,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class SendButton extends StatelessWidget {
  final VoidCallback callback;

  const SendButton({Key key, this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        callback();
      },
      child: CircleAvatar(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.send, color: Colors.white,),
      ),
    );
  }
}


void choiceAction(String choice) {
  print(choice);
}

class Constants {
  static const String AddContacts = "Add to contacts";
  static const String Media = "Media, links & docs";
  static const String Search = "Search";
  static const String MuteAlerts = "Mute notifications";
  static const String Wallpaper = "Wallpaper";
  static const String More = "More";
  static const List<String> choices = <String>[AddContacts, Media, Search, MuteAlerts, Wallpaper, More];
}

Widget sentMessage(String message) {
  final r = 2.5;
  final thread = Transform(
    alignment: Alignment.center,
    transform: Matrix4.rotationY(-(pi)),
    child: ClipPath(
      clipper: ClipThread(r),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(r)),
        child: Container(
          padding: EdgeInsets.fromLTRB(8.0 + 2 * r, 8.0, 8.0, 8.0),
          color: Color(0xFFdcf8c6),
          child: Transform(
            transform: Matrix4.rotationY(pi),
            alignment: Alignment.center,
            child: Text(message),
          ),
        ),
      ),
    ),
  );
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 8.0,
        ),
        thread,
      ],
    ),
  );
}