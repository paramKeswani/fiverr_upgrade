import 'package:f/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formkey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool req = false;

  FirebaseAuth _auth = FirebaseAuth.instance;
  void login() {
    bool req = false;
    setState(() {
      req = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {
      setState(() {
        req = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
      // Handle successful authentication here
    }).onError((error, stackTrace) {
      utils().toastMessage(error.toString());
      req = false;
      setState(() {
        req = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    confirmpasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) async {
        SystemNavigator.pop();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Center(child: const Text('Sign Up')),
            backgroundColor: Colors.amber,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: Container(
            width: double.infinity,
            height: 700,
            color: const Color.fromARGB(255, 223, 230, 236),
            margin: EdgeInsets.fromLTRB(50, 100, 50, 100),
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return 'Empty email';
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return 'Empty email';
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return 'Empty email';
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: confirmpasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return 'Empty email';
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                      width: double.infinity,
                    ),
                    OutlinedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            login();
                          }
                        },
                        child: Text("Sign Up")),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Already have an account? "),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.purple),
                        ))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
