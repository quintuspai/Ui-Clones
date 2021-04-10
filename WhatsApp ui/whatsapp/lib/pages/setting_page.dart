import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 5.0)),
          ListTile(
            leading: new CircleAvatar(
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/flutterintro-3a3f4.appspot.com/o/IMG-20200126-WA0000_2.jpg?alt=media&token=d23e6fb3-223d-4cba-8666-2f44974ec315"),
            ),
            title: Text(
              "Quintus Pai",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Hey there i am using whatsapp.',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10.0,
              ),
            ),
          ),
          Divider(),
          SizedBox(
            height: 5.0,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              child: Icon(
                Icons.account_circle,
                color: Theme.of(context).hintColor,
              ),
            ),
            title: Text(
              'Account',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
              ),
            ),
            subtitle: Text(
              'Privacy, security, change number',
              style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 10.0,
              ),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              child: Icon(Icons.chat,color: Theme.of(context).hintColor,),
            ),
            title: Text(
              'Chat',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
              ),
            ),
            subtitle: Text(
              'Theme, wallpapers, chat history',
              style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 10.0,
              ),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              child: Icon(
                Icons.notifications,
                color: Theme.of(context).hintColor,
              ),
            ),
            title: Text(
              'Notifications',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
              ),
            ),
            subtitle: Text(
              'Message, group & call tones',
              style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 10.0,
              ),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              child: Icon(
                Icons.data_usage,
                color: Theme.of(context).hintColor,
              ),
            ),
            title: Text(
              'Data and storage usage',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
              ),
            ),
            subtitle: Text(
              'Network usage, auto-download',
              style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 10.0,
              ),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              child: Icon(
                Icons.help_outline,
                color: Theme.of(context).hintColor,
              ),
            ),
            title: Text(
              'Help',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
              ),
            ),
            subtitle: Text(
              'FAQ, contact us, privacy policy',
              style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 10.0,
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              child: Icon(
                Icons.group,
                color: Theme.of(context).hintColor,
              ),
            ),
            title: Text(
              'Invite a friend',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
              ),
            ),
          )
        ],
      ),
    );
  }
}