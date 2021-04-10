import 'package:flutter/material.dart';
import 'package:pinterest/pages/account.dart';
import 'package:pinterest/pages/home.dart';
import 'package:pinterest/pages/notification.dart';
import 'package:pinterest/pages/search.dart';
import 'package:pinterest/ui/lander.dart';

class BottomNavBarController extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavBarControllerState();
  }
}

class _BottomNavBarControllerState extends State<BottomNavBarController>{

  final List<Widget> pages = [
    HomePage(key : PageStorageKey('Page1')),
    SearchPage(key : PageStorageKey('Page2')),
    NotificationPage(key : PageStorageKey('Page3')),
    AccountPage(key : PageStorageKey('Page4')),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) {
    return BottomNavigationBar(
      onTap: (int index) => setState(() => _selectedIndex = index),
      showUnselectedLabels: false,
      showSelectedLabels: false,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
      currentIndex: selectedIndex,
      items: <BottomNavigationBarItem>[

        BottomNavigationBarItem(
            icon: Icon(Icons.home),
          title: Text("Home"),
        ),

        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
        ),

        BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text("Updates"),
        ),

        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text("Account"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          PageStorage(
              bucket: bucket,
              child: pages[_selectedIndex]
          ),
          Positioned(
            left: 99,
              right: 99,
              top: MediaQuery.of(context).size.height-100,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0),
                  ),
                  child: _bottomNavigationBar(_selectedIndex)
              )
          ),
        ],
      ),
    );
  }
}