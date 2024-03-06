import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f/n_search.dart';
import 'package:f/serach_home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/ui/firebase_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'pop.dart';
import 'n_search.dart';
import 'n_form.dart';
import 'n_logout.dart';
import 'n_contact.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'display.dart';
import 'package:f/login.dart';
import 'package:f/splash_screen.dart';
import 'package:f/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPage(currentPage), // <-- Separate method to build pages
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.blueGrey[300],
        destinations: const [
          NavigationDestination(icon: Icon(Icons.list), label: ""),
          NavigationDestination(icon: Icon(Icons.add), label: ""),
          NavigationDestination(icon: Icon(Icons.logout), label: "")
        ],
        onDestinationSelected: (int index) {
          if (index == 2) {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text("Alert Dialog Box"),
                content: const Text("You have raised a Alert Dialog Box"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Container(
                        child: ElevatedButton(
                            onPressed: () {
                              auth.signOut().then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              }).onError((error, stackTrace) {
                                utils().toastMessage(error.toString());
                              });
                            },
                            child: Text("Logout"))),
                  ),
                ],
              ),
            );
            // Show logout confirmation dialog
          } else {
            setState(() {
              currentPage = index;
            });
          }
        },
        selectedIndex: currentPage,
      ),
    );
  }

  Widget buildPage(int index) {
    if (index >= 0 && index < 3) {
      switch (index) {
        case 0:
          // Page 0 content
          return YourFirstPageWidget();
        case 1:
          // Page 2 content
          return CustomForm();
        case 2:
          // Page 4 content
          return logout();
        default:
          // Handle invalid index by returning the first page
          return YourFirstPageWidget();
      }
    } else {
      // Handle out-of-range index by returning the first page
      return YourFirstPageWidget();
    }
  }
}

// Example placeholder widgets for each page
class YourFirstPageWidget extends StatelessWidget {
  final DatabaseReference ref = FirebaseDatabase.instance.ref('abc');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey[200],
        title: Text(
          "Home",
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (context, DataSnapshot, Animation, Index) {
                return Card(
                  margin: EdgeInsets.fromLTRB(20, 15, 20, 0), // Add margin
                  child: Padding(
                    padding: EdgeInsets.all(10), // Add padding
                    child: Row(
                      children: [
                        Icon(
                          Icons.album,
                          size: 50,
                        ),
                        SizedBox(width: 10), // Add spacing
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DataSnapshot.child('j_cat').value.toString(),
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(),
                              Text(
                                DataSnapshot.child('j_deadl').value.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                DataSnapshot.child('j_desc').value.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                DataSnapshot.child('c_name').value.toString(),
                                style: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_right),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DisplayScreen(
                                  jCat: DataSnapshot.child('j_cat')
                                      .value
                                      .toString(),
                                  c_name: DataSnapshot.child('c_name')
                                      .value
                                      .toString(),
                                  add: DataSnapshot.child('address')
                                      .value
                                      .toString(),
                                  upload_date: DataSnapshot.child('upload_date')
                                      .value
                                      .toString(),
                                  jDeadl: DataSnapshot.child('j_deadl')
                                      .value
                                      .toString(),
                                  jDesc: DataSnapshot.child('j_desc')
                                      .value
                                      .toString(),
                                  cemail: DataSnapshot.child('com_email')
                                      .value
                                      .toString(),
                                  comments: DataSnapshot.child('comments')
                                      .value
                                      .toString(),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
