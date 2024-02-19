import 'package:flutter/material.dart';

class Pop extends StatefulWidget {
  const Pop({Key? key}) : super(key: key);

  @override
  State<Pop> createState() => _PopState();
}

class _PopState extends State<Pop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 270,
              margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.3),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Architect Engineer",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Image.network(
                            "https://i.pinimg.com/736x/23/ea/0c/23ea0c17068f4e290bada3457c5fef0b.jpg",
                            height: 100,
                            width: 80,
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                                child: Text(
                                  "Apple",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "USA",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.black),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                    child: const Text(
                      "389 Applicants",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Divider(color: Colors.black),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Job Description:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                width: double.infinity,
                height: 230,
                margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.3),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text(
                        "Actively Recruting ,Send CV/Resume:",
                        style: TextStyle(
                            color: Colors.teal[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: Text("Easy Apply Now")),
                    Divider(color: Colors.black),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text(
                        "Uploaded on :                                    2022-7-7",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text(
                        "Deadline Date :                               2022-7-15",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ],
                )),
            Container(
                alignment: Alignment.topCenter,
                width: double.infinity,
                height: 200,
                margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.3),
                ),
                child: Container(
                    // alignment: Alignment.topCenter,
                    child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        //action coe when button is pressed
                      },
                      icon: Icon(Icons.send),
                    ),
                    IconButton(
                      onPressed: () {
                        //action coe when button is pressed
                      },
                      icon: Icon(Icons.send),
                    ),
                  ],
                ))),
          ],
        ),
      ),
    );
  }
}
