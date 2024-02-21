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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPage(currentPage), // <-- Separate method to build pages
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
        },
        selectedIndex: currentPage,
      ),
    );
  }

  Widget buildPage(int index) {
    switch (index) {
      case 0:
        // Page 0 content
        return YourFirstPageWidget();
      case 1:
        // Page 1 content
        return n_search();
      case 2:
        // Page 2 content
        return form();
      case 3:
        // Page 3 content
        return contact();
      case 4:
        // Page 4 content
        return logout();
      default:
        // Handle invalid index
        return Container();
    }
  }
}

// Example placeholder widgets for each page
class YourFirstPageWidget extends StatelessWidget {
  final DatabaseReference ref = FirebaseDatabase.instance.ref('abc');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                        child: Icon(Icons.album),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    DataSnapshot.child('j_cat')
                                        .value
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(DataSnapshot.child('j_deadl')
                                      .value
                                      .toString()),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Flexible(
                                    child: Text(DataSnapshot.child('j_desc')
                                        .value
                                        .toString()),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Flexible(
                                    child: Text(DataSnapshot.child('c_name')
                                        .value
                                        .toString()),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: const Icon(Icons.arrow_right),
                          iconSize: 30,
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
                                  // jTitle: DataSnapshot.child('j_title')
                                  //     .value
                                  //     .toString(),
                                  cemail: DataSnapshot.child('com_email')
                                      .value
                                      .toString(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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

//  return ListView.builder(
//               shrinkWrap: true,
//               itemCount: data.length,
//               physics: NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//                 var cardData = data[index];
//                 return TransactionCard(
//                   data: cardData,
//                 );
//               });
