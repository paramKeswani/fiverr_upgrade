import 'package:f/utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class form extends StatefulWidget {
  const form({super.key});

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  final companyNameController = TextEditingController();
  final companyAddController = TextEditingController();
  // final jobTitleController = TextEditingController();
  final uploadedOnController = TextEditingController();
  final deadlineController = TextEditingController();
  final jobCatController = TextEditingController();

  final jobDescController = TextEditingController();
  final jobDeadLineController = TextEditingController();
  final companyImageController = TextEditingController();
  final companyEmailController = TextEditingController();
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
                    hintText: 'Job Name',
                    labelText: 'Job Category',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: companyNameController,
                decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Name of Company',
                    labelText: 'Company',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: companyAddController,
                decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Address of Company',
                    labelText: 'Company Address',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: uploadedOnController,
                decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'uploaded date',
                    labelText: 'Uploaded On',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: deadlineController,
                decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'DeadLine Date',
                    labelText: 'DeadLine Date ',
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
                controller: companyEmailController,
                decoration: const InputDecoration(
                    icon: const Icon(Icons.calendar_today),
                    hintText: 'Enter company email',
                    labelText: 'Company email',
                    border: OutlineInputBorder()),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: OutlinedButton(
                      onPressed: () {
                        databaseRef1
                            .child(jobCatController.text.toString())
                            .set({
                          'j_cat': jobCatController.text.toString(),
                          // 'j_title': jobTitleController.text.toString(),
                          'j_deadl': deadlineController.text.toString(),

                          'c_name': companyNameController.text.toString(),
                          'address': companyAddController.text.toString(),
                          'upload_date': uploadedOnController.text.toString(),
                          'j_desc': jobDescController.text.toString(),
                          'com_email': companyEmailController.text.toString(),
                          'comments': [
                            {
                              'name': 'abc',
                              'message': 'intrested in this job ?',
                              'date': '00:00:00'
                            }
                          ],
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
