import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:f/utils/utils.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DisplayScreen(
        jCat: 'Job Category',
        c_name: 'Company Name',
        add: 'Company Address',
        upload_date: '2024-03-04',
        jDeadl: '2024-03-10',
        jDesc: 'Job Description',
        cemail: 'company@example.com',
        comments: '0',
      ),
    );
  }
}

class DisplayScreen extends StatefulWidget {
  final String jCat;
  final String c_name;
  final String add;
  final String upload_date;
  final String jDeadl;
  final String jDesc;
  final String cemail;
  final String comments;

  DisplayScreen({
    required this.jCat,
    required this.c_name,
    required this.add,
    required this.upload_date,
    required this.jDeadl,
    required this.jDesc,
    required this.cemail,
    required this.comments,
  });

  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  late User? currentUser;
  late String commenterName;
  late DatabaseReference databaseRef1;
  late List<Map<String, dynamic>> filedata = [];
  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser;
    commenterName = currentUser != null
        ? currentUser!.displayName ?? currentUser!.email ?? 'Anonymous'
        : 'Anonymous';
    databaseRef1 = FirebaseDatabase.instance
        .ref()
        .child("abc")
        .child(widget.jDesc)
        .child('comments');
  }

// Check if a user is signed in

  @override
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List req = [];

  void submitDataToDatabase(List<Map<String, dynamic>> data) {
    DateTime now = DateTime.now();
    final formattedTime = DateFormat('HH:mm:ss').format(now);
    var commentData = {
      'name': commenterName,
      'message': commentController.text,
      'date': formattedTime
    };

    setState(() {
      filedata.insert(0, commentData);
    });

    databaseRef1.push().set({
      'name': commenterName,
      'message': commentController.text,
      'date': formattedTime
    }).then((_) {
      utils().toastMessage("submitted");
    }).catchError((error, stackTrace) {
      utils().toastMessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    req = [
      {
        'name': commenterName,
        'pic': 'https://example.com/profile.jpg',
        'message': commentController.text,
        'date': '2024-03-04'
      }
    ];
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
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
                      "${widget.jCat}",
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
                          // child: Image.network(
                          //   // "https://i.pinimg.com/736x/23/ea/0c/23ea0c17068f4e290bada3457c5fef0b.jpg"

                          //   // height: 100,
                          //   // width: 80,
                          // ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                                child: Text(
                                  "${widget.c_name}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "${widget.add}",
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
                    child: Text(
                      " 0 Applicants",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Divider(color: Colors.black),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    child: Column(children: [
                      Text(
                        "Job Description:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${widget.jDesc}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
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
                        "Actively Recruiting, Send CV/Resume:",
                        style: TextStyle(
                            color: Colors.teal[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _sendingMails();
                        },
                        child: Text("Easy Apply Now")),
                    Divider(color: Colors.black),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text(
                        "Uploaded on :                                ${widget.upload_date}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text(
                        "Deadline Date :                               ${widget.jDeadl}",
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
                  child: Container(
                    child: Container(
                      width: double.infinity,
                      height: 600,
                      child: CommentBox(
                        child: commentChild(filedata),
                        labelText: 'Write a comment...',
                        errorText: 'Comment cannot be blank',
                        withBorder: false,
                        sendButtonMethod: () {
                          if (formKey.currentState!.validate()) {
                            submitDataToDatabase(filedata);
                            commentController.clear();
                            FocusScope.of(context).unfocus();
                          } else {
                            print("Not validated");
                          }
                        },
                        formKey: formKey,
                        commentController: commentController,
                        backgroundColor: Colors.pink,
                        textColor: Colors.white,
                        sendWidget: Container(
                          child: IconButton(
                            icon: Icon(
                              Icons.send_sharp,
                              size: 30,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              submitDataToDatabase(filedata);
                              // commentChild(filedata);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                    radius: 50,
                  ),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
              trailing: Text(data[i]['date'], style: TextStyle(fontSize: 10)),
            ),
          )
      ],
    );
  }

  _sendingMails() async {
    var url = Uri.parse("mailto:${widget.cemail}");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
