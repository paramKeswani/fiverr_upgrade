import 'package:f/login.dart';
import 'package:f/splash_screen.dart';
import 'package:f/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class logout extends StatefulWidget {
  const logout({super.key});

  @override
  State<logout> createState() => _logoutState();
}

class _logoutState extends State<logout> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Logout'),
          actions: [
            IconButton(
              onPressed: () {
                auth.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                }).onError((error, stackTrace) {
                  utils().toastMessage(error.toString());
                });
              },
              icon: Icon(Icons.login_outlined),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: Container(
          child: Center(
            child: ElevatedButton(
              onPressed: () {
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
                          color: Colors.green,
                          padding: const EdgeInsets.all(14),
                          child: const Text("okay"),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Show alert Dialog box"),
            ),
          ),
        ));
  }
}
