import 'package:f/utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({Key? key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final companyNameController = TextEditingController();
  final companyAddController = TextEditingController();
  final uploadedOnController = TextEditingController();
  final deadlineController = TextEditingController();
  final jobCatController = TextEditingController();
  final jobDescController = TextEditingController();
  final companyEmailController = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.ref("Posts");
  final databaseRef1 = FirebaseDatabase.instance.ref("abc");
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      key: _formKey,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Please Fill All Fields",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextFormField(
                controller: jobCatController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Job Category',
                  labelText: 'Job Category',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: companyNameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.business),
                  hintText: 'Company Name',
                  labelText: 'Company Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: companyAddController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.location_on),
                  hintText: 'Company Address',
                  labelText: 'Company Address',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: uploadedOnController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today),
                  hintText: 'Uploaded On',
                  labelText: 'Uploaded On',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: deadlineController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today),
                  hintText: 'Deadline Date',
                  labelText: 'Deadline Date',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: jobDescController,
                maxLines: 3,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.description),
                  hintText: 'Job Description',
                  labelText: 'Job Description',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: companyEmailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Company Email',
                  labelText: 'Company Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    databaseRef1.child(jobCatController.text.toString()).set({
                      'j_cat': jobCatController.text.toString(),
                      'j_deadl': deadlineController.text.toString(),
                      'c_name': companyNameController.text.toString(),
                      'address': companyAddController.text.toString(),
                      'upload_date': uploadedOnController.text.toString(),
                      'j_desc': jobDescController.text.toString(),
                      'com_email': companyEmailController.text.toString(),
                      'comments': [
                        {
                          'name': 'abc',
                          'message': 'interested in this job?',
                          'date': '00:00:00',
                        },
                      ],
                    }).then(
                      (value) {
                        utils().toastMessage("Submitted");
                      },
                    ).onError((error, stackTrace) {
                      utils().toastMessage(error.toString());
                    });
                  },
                  child: Text("Add"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
