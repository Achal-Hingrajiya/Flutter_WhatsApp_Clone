import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const MaterialColor greenWA = MaterialColor(
    // 0xffe55f48, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    0xff075E54,
    <int, Color>{
      50: Color(0xFFE1ECEA),
      100: Color(0xFFB5CFCC),
      200: Color(0xFF83AFAA),
      300: Color(0xFF518E87),
      400: Color(0xFF2C766E),
      500: Color(0xFF075E54),
      600: Color(0xFF06564D),
      700: Color(0xFF054C43),
      800: Color(0xFF04423A),
      900: Color(0xFF023129),
    },
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: greenWA,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WhatsApp'),
          actions: const [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Icon(Icons.search_rounded),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Icon(Icons.more_vert_rounded),
            ),
          ],
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "STATUS",
              ),
              Tab(
                text: "CALLS",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("Chat Section"),
            ),
            Center(
              child: Text("Status Section"),
            ),
            Center(
              child: Text("Calls Section"),
            ),
          ],
        ),
      ),
    );
  }
}
