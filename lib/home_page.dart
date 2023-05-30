import 'package:flutter/material.dart';
import 'persistent_bottom_bar_scaffold.dart';
import 'localAndWebObjectsView.dart';

class HomePage extends StatelessWidget {
  final _tab1navigatorKey = GlobalKey<NavigatorState>();
  final _tab2navigatorKey = GlobalKey<NavigatorState>();
  final _tab3navigatorKey = GlobalKey<NavigatorState>();


  @override
  Widget build(BuildContext context) {
    return PersistentBottomBarScaffold(
      items: [
        PersistentTabItem(
          tab: TabPage1(),
          icon: Icons.aod,
          title: 'Star Map',
          navigatorkey: _tab1navigatorKey,
        ),
        PersistentTabItem(
          tab: TabPage2(),
          icon: Icons.sunny,
          title: 'Solar system',
          navigatorkey: _tab2navigatorKey,
        ),
        PersistentTabItem(
          tab: TabPage3(),
          icon: Icons.stacked_bar_chart,
          title: 'Stats',
          navigatorkey: _tab3navigatorKey,
        ),
      ],
    );
  }
}

class TabPage1 extends StatelessWidget {
  const TabPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('TabPage1 build');
    return Scaffold(
      //backgroundColor: Colors.indigo[900],
      appBar: AppBar(title: Text('Star Map')),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(''),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(name: 'https://github.com/AS-37/AstroApp/raw/main/assets/solar_system/Sun.glb',)));
                },
                child: Text('Display star map'))
          ],
        ),
      ),
    );
  }
}

class TabPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('TabPage2 build');
    return Scaffold(
      appBar: AppBar(title: Text('View our solar system in AR')),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pick a star from the solar system to view in AR'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(name: 'https://github.com/AS-37/AstroApp/raw/main/assets/solar_system/Sun.glb',)));
                },
                child: Text('Sun')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(name: 'https://github.com/AS-37/AstroApp/raw/main/assets/solar_system/Mercury.glb',)));
                },
                child: Text('Mercury')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(name: 'https://github.com/AS-37/AstroApp/raw/main/assets/solar_system/Venus.glb',)));
                },
                child: Text('Venus')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(name: 'https://github.com/AS-37/AstroApp/raw/main/assets/solar_system/Earth.glb',)));
                },
                child: Text('Earth')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(name: 'https://github.com/AS-37/AstroApp/raw/main/assets/solar_system/Moon.glb',)));
                },
                child: Text('Moon')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(name: 'https://github.com/AS-37/AstroApp/raw/main/assets/solar_system/Mars.glb',)));
                },

                child: Text('Mars')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(name: 'https://github.com/AS-37/AstroApp/raw/main/assets/solar_system/Jupiter.glb',)));
                },
                child: Text('Jupiter')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(name: 'https://github.com/AS-37/AstroApp/raw/main/assets/solar_system/Saturn.glb',)));
                },
                child: Text('Saturn')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(name: 'https://github.com/AS-37/AstroApp/raw/main/assets/solar_system/Uranus.glb',)));

                },
                child: Text('Uranus')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(name: 'https://github.com/AS-37/AstroApp/raw/main/assets/solar_system/Neptune.glb',)));

                },
                child: Text('Neptune')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(name: 'https://github.com/AS-37/AstroApp/raw/main/assets/solar_system/solar_system.glb',)));

                },
                child: Text('Whole solar system'))
          ],
        ),
      ),
    );
  }
}

class TabPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('TabPage3 build');
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tab 3'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Page2('tab3')));
                },
                child: Text('Go to page2'))
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  final String inTab;

  const Page1(this.inTab);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 1')),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('in $inTab Page 1'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Page2(inTab)));
                },
                child: Text('Go to page2'))
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  final String inTab;

  const Page2(this.inTab);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 2')),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('in $inTab Page 2'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Page3(inTab)));
                },
                child: Text('Go to page3'))
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  final String inTab;

  const Page3(this.inTab);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 3')),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('in $inTab Page 3'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Go back'))
          ],
        ),
      ),
    );
  }
}