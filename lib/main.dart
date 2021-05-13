import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redesign_whatsapp/module/bottombar/BottomBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: _tabController, children: [
        Center(
            child: Icon(
          CupertinoIcons.chat_bubble_2_fill,
        )),
        Center(
            child: Icon(
          CupertinoIcons.phone_fill,
        )),
        Center(
            child: Icon(
          CupertinoIcons.person_2_fill,
        )),
      ]),
      bottomNavigationBar: BottomBar(
        controller: _tabController,
        badgeCount: [9, 0, 0],
      ),
    );
  }
}
