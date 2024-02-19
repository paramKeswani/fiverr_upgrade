import 'package:f/utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class form extends StatefulWidget {
  const form({super.key});

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  final jobCatController = TextEditingController();
  final jobTitleController = TextEditingController();
  final jobDescController = TextEditingController();
  final jobDeadLineController = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.ref("Posts");

  final databaseRef1 = FirebaseDatabase.instance.ref("abc");
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Text("Please Fill All Fields",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: jobCatController,
                decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your name',
                    labelText: 'Job Category',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: jobTitleController,
                decoration: const InputDecoration(
                    icon: const Icon(Icons.phone),
                    hintText: 'Enter a phone number',
                    labelText: 'Job Title',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: jobDescController,
                decoration: const InputDecoration(
                    icon: const Icon(Icons.calendar_today),
                    hintText: 'Enter your date of birth',
                    labelText: 'Job Description',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: jobDeadLineController,
                decoration: const InputDecoration(
                    icon: const Icon(Icons.calendar_today),
                    hintText: 'Enter your date of birth',
                    labelText: 'Job Deadline Date :',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: OutlinedButton(
                      onPressed: () {
                        databaseRef1
                            .child(DateTime.now()
                                .microsecondsSinceEpoch
                                .toString())
                            .set({
                          'j_cat': jobCatController.text.toString(),
                          'j_title': jobTitleController.text.toString(),
                          'j_desc': jobDescController.text.toString(),
                          'j_deadl': jobDeadLineController.text.toString()
                        }).then(
                          (value) {
                            utils().toastMessage("submitted");
                          },
                        ).onError((error, stackTrace) {
                          utils().toastMessage(error.toString());
                        });
                      },
                      child: Text("Add"))),
              Container(
                  // padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                  // child:   RaisedButton(
                  //   child: const Text('Submit'),
                  //   onPressed: null,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
