import "home.dart";
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

//thinngs starting from capital letter are called widgets
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //appbar, body , bottom navigation bar
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const RootPage(),
    );
  }
}

//if on click some change is needed then we use staete ful widget
class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

//always make variables befor build
class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Hello"),
      ),
      body:const home(),
      //action button below
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            //debugprint prinsts something in the terminal
            debugPrint("abc");
          },
          child: const Icon(Icons.add)),

      //Bottom navigation bar is like the normal navigation bar in the phone which is seen below
      //destination represents the like on click where we have to go
      //so navigationDestination  it contains the icons which reperesents it and labels
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(
              icon: Icon(Icons.notification_add_sharp), label: "profile"),
        ],
        //generally on something represent the functions like onpress and all
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
