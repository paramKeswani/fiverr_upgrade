import 'package:flutter/material.dart';

class search_home extends StatefulWidget {
  const search_home({super.key});

  @override
  State<search_home> createState() => _search_homeState();
}

class _search_homeState extends State<search_home> {
  bool typing = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
            ),
          ),
          backgroundColor: Colors.amber,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.search,
                    size: 26.0,
                  ),
                )),
          ],
        ),
        body: Column(
          children: [
            Card(
              shadowColor: Colors.black,
              elevation: 10,
              child: Container(
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 10, 80),
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      decoration: BoxDecoration(
                          border: Border(
                        right: BorderSide(
                          //                   <--- right side
                          color: Colors.black,
                          width: 3.0,
                        ),
                      )),
                      child: Image.network(
                          "https://i.pinimg.com/736x/23/ea/0c/23ea0c17068f4e290bada3457c5fef0b.jpg",
                          height: 700,
                          width: 80),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Architect Engineer",
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                          Text("Apple",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Text("We Need an Architect Engineer",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          Text("for our new ofice design",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          Text("and its construction .",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          Text("Architectural engineers apply",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          Text("practical and ....",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Container(
                      child: Icon(Icons.navigate_next),
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    ),
                  ],
                ),
                color: Color.fromARGB(255, 194, 63, 53),
                height: 200,
                width: double.infinity,
                margin: EdgeInsets.all(10),
              ),
            ),
          ],
        ));
  }
}
