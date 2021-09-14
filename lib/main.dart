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

  Widget _buildChatWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          color: Colors.white70,
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://picsum.photos/70/70",
                ),
                radius: 28,
              ),
              const SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Sundar Pichai",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          Text("Yesterday"),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.check,
                            size: 15,
                            color: Colors.black26,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Sorry, I can't talk now, I'm making WahtsApp",
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: Colors.black12,
        ),
      ],
    );
  }

  List<Widget> _generateRandomChats(BuildContext context) {
    return List<Widget>.generate(50, (index) => _buildChatWidget(context));
  }

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
        body: TabBarView(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: _generateRandomChats(context),
              ),
            ),
            const Center(
              child: Text("Status Section"),
            ),
            Column(
              children: [
                Container(
                  height: 80,
                  color: Colors.white70,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://picsum.photos/70/70",
                        ),
                        radius: 28,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Sundar Pichai",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.call_received_sharp,
                                    color: Colors.red.shade700,
                                    size: 15,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "(4) Today, 12:43 am",
                                    style: TextStyle(
                                      color: Colors.black45,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const Icon(Icons.call),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: Colors.black12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
