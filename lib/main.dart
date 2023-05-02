import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_task/tweet_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.all(10.0),
          child: const CircleAvatar(backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/twitterLogo.png'),
          ),
        ),
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: listOfTweets(),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.pen),
        onPressed: (() {}),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildBottomIconButton(Icons.home, Colors.blue),
          buildBottomIconButton(Icons.search, Colors.black45),
          buildBottomIconButton(Icons.notifications, Colors.black45),
          buildBottomIconButton(Icons.mail_outline, Colors.black45),
        ],
      )),
    );
  }

  Widget buildBottomIconButton(IconData icon, Color color) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        icon,
        color: color,
      ),
    );
  }

  Widget listOfTweets() {
    return Container(
      color: Colors.white,
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return tweets[index];
          },
          separatorBuilder: (BuildContext context, int index) => Divider(
                height: 0,
              ),
          itemCount: tweets.length),
    );
  }
}
