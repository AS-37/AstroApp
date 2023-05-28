import 'package:flutter/material.dart';

class PersistentBottomBarScaffold extends StatefulWidget {

  final List<PersistentTabItem> items;

  const PersistentBottomBarScaffold({Key? key, required this.items})
      : super(key: key);

  @override
  _PersistentBottomBarScaffoldState createState() =>
      _PersistentBottomBarScaffoldState();
}

class _PersistentBottomBarScaffoldState
    extends State<PersistentBottomBarScaffold> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {

        if (widget.items[_selectedTab].navigatorkey?.currentState?.canPop() ??
            false) {
          widget.items[_selectedTab].navigatorkey?.currentState?.pop();
          return false;
        } else {
          // if current tab can't be popped then use the root navigator
          return true;
        }
      },
      child: Scaffold(


        body: IndexedStack(
          index: _selectedTab,
          children: widget.items
              .map((page) => Navigator(

            key: page.navigatorkey,
            onGenerateInitialRoutes: (navigator, initialRoute) {
              return [
                MaterialPageRoute(builder: (context) => page.tab)
              ];
            },
          ))
              .toList(),
        ),


        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.indigo[900],
          currentIndex: _selectedTab,
          onTap: (index) {

            if (index == _selectedTab) {

              widget.items[index].navigatorkey?.currentState
                  ?.popUntil((route) => route.isFirst);


              // widget.items[index].navigatorkey?.currentState?.pop();
            } else {
              setState(() {
                _selectedTab = index;
              });
            }
          },
          items: widget.items
              .map((item) => BottomNavigationBarItem(
              icon: Icon(item.icon), label: item.title))
              .toList(),
        ),
      ),
    );
  }
}


class PersistentTabItem {
  final Widget tab;
  final GlobalKey<NavigatorState>? navigatorkey;
  final String title;
  final IconData icon;

  PersistentTabItem(
      {required this.tab,
        this.navigatorkey,
        required this.title,
        required this.icon});
}