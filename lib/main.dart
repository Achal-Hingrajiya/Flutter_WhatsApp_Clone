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
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          color: Colors.white70,
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://picsum.photos/70/70",
                  ),
                  radius: 28,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 76,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Sundar Pichai",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        Expanded(child: Container()),
                        const Text(
                          "Yesterday",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black45,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.check,
                          size: 15,
                          color: Colors.black26,
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Text(
                          "Sorry, I can't talk right now.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black45,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Container(
            height: 0.7,
            width: MediaQuery.of(context).size.width - 91,
            color: Colors.black12,
          ),
        ),
      ],
    );
  }

  List<Widget> _generateRandomChats(BuildContext context) {
    return List<Widget>.generate(50, (index) => _buildChatWidget(context));
  }

  Widget _buildCallLogWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 80,
          color: Colors.white70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(
                    "https://picsum.photos/60/60",
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sundar Pichai",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
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
              Expanded(
                child: Container(),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.call,
                  color: MyApp.greenWA[300],
                ),
              ),
              const SizedBox(
                width: 5,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Container(
            height: 0.7,
            width: MediaQuery.of(context).size.width - 101,
            color: Colors.black12,
          ),
        ),
      ],
    );
  }

  List<Widget> _generateRandomCallLogs(BuildContext context) {
    return List<Widget>.generate(50, (index) => _buildCallLogWidget(context));
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
            SingleChildScrollView(
              child: Column(
                children: _generateRandomCallLogs(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
