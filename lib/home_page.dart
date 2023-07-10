import 'package:astroapp/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'persistent_bottom_bar_scaffold.dart';
import 'localAndWebObjectsView.dart';
import 'dart:ui';
import '3d_sky.dart';


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
          title: 'STAR MAP',
          navigatorkey: _tab1navigatorKey,
        ),
        PersistentTabItem(
          tab: TabPage2(),
          icon: Icons.sunny,
          title: 'SOLAR SYSTEM',
          navigatorkey: _tab2navigatorKey,
        ),
        PersistentTabItem(
          tab: TabPage3(),
          icon: Icons.stacked_bar_chart,
          title: 'STATS AND FACTS',
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
      appBar: AppBar(title: Text('STAR MAP'), backgroundColor: Colors.black),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(''),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SkyMap()));
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
      appBar: AppBar(title: Text('SOLAR SYSTEM IN AR'), backgroundColor: Colors.black),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pick a star from the solar system to view in AR'),
            ElevatedButton(
                style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(name: 'https://github.com/AS-37/AstroApp/raw/main/assets/solar_system/Sun.glb',)));
                },
                child: Text('SUN')),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(name: 'https://github.com/AS-37/AstroApp/raw/main/assets/solar_system/Mercury.glb',)));
                },
                child: Text('MERCURY')),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(name: 'https://github.com/AS-37/AstroApp/raw/main/assets/solar_system/Venus.glb',)));
                },
                child: Text('VENUS')),
            ElevatedButton(
                style: ButtonStyle(

                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(name: 'https://github.com/AS-37/AstroApp/raw/main/assets/solar_system/Earth.glb',)));
                },
                child: Text('EARTH')),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(name: 'https://github.com/AS-37/AstroApp/raw/main/assets/solar_system/Moon.glb',)));
                },
                child: Text('MOON')),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(name: 'https://github.com/AS-37/AstroApp/raw/main/assets/solar_system/Mars.glb',)));
                },

                child: Text('MARS')),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(name: 'https://github.com/AS-37/AstroApp/raw/main/assets/solar_system/Jupiter.glb',)));
                },
                child: Text('JUPITER')),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(name: 'https://github.com/AS-37/AstroApp/raw/main/assets/solar_system/Saturn.glb',)));
                },
                child: Text('SATURN')),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(name: 'https://github.com/AS-37/AstroApp/raw/main/assets/solar_system/Uranus.glb',)));

                },
                child: Text('URANUS')),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(name: 'https://github.com/AS-37/AstroApp/raw/main/assets/solar_system/Neptune.glb',)));

                },
                child: Text('NEPTUNE')),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalAndWebObjectsView(name: 'https://github.com/AS-37/AstroApp/raw/main/assets/solar_system/solar_system.glb',)));

                },
                child: Text('WHOLE SOLAR SYSTEM'))
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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context,child) => MaterialApp(
        title: 'Planets',
        debugShowCheckedModeBanner: false,
        builder: (context, widget) {
          ScreenUtil.init(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        theme: ThemeData(
          primarySwatch: Colors.grey,
          textTheme: GoogleFonts.tekoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: const HomeScreen(),
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