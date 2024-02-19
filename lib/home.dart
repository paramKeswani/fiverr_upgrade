import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f/n_search.dart';
import 'package:f/serach_home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/ui/firebase_list.dart';
import 'package:flutter/material.dart';
import 'pop.dart';
import 'n_search.dart';
import 'n_form.dart';
import 'n_logout.dart';
import 'n_contact.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('abc');

  @override
  Widget build(BuildContext context) {
    switch (currentPage) {
      case 0:
    }
    return Scaffold(
      // Your existing Scaffold properties
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.list), label: ""),
          NavigationDestination(icon: Icon(Icons.search), label: ""),
          NavigationDestination(icon: Icon(Icons.add), label: ""),
          NavigationDestination(icon: Icon(Icons.account_circle), label: ""),
          NavigationDestination(icon: Icon(Icons.logout), label: "")
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
          switch (index) {
            case 0:
              // Navigate to the list page
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => home()));
              break;
            case 1:
              // Navigate to the search page
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => n_search()));
              break;
            case 2:
              // Navigate to the add page
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => form()));
              break;
            case 3:
              // Navigate to the account page
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => contact()));
              break;
            case 4:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => logout()));
              break;
          }
        },
        selectedIndex: currentPage,
      ),
    );

    Widget _buildRow(String name) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 12),
            Container(height: 2, color: Colors.redAccent),
            SizedBox(height: 12),
            ElevatedButton(
              child: Row(
                children: <Widget>[
                  Icon(Icons.play_arrow),
                  SizedBox(width: 12),
                  Text(name),
                  Spacer(),
                ],
              ),
              onPressed: () {},
            ),
          ],
        ),
      );
    }
  }
}
