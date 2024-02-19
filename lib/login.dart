import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'home.dart';
import "utils/utils.dart";
import 'main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  void login() {
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text.toString())
        .then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }).onError((error, stackTrace) {
      utils().toastMessage(error.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("Login")),
        backgroundColor: Color.fromARGB(255, 223, 230, 236),
      ),
      body: Container(
        width: double.infinity,
        height: 700,
        color: const Color.fromARGB(255, 223, 230, 236),
        margin: EdgeInsets.fromLTRB(50, 100, 50, 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("images/login.jpg"),
              Form(
                key: _formkey,
                child: Column(children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
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
                      if (value!.isEmpty) return 'Empty password';
                      return null;
                    },
                  ),
                ]),
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
                  child: Text("Login")),
              SizedBox(
                height: 10,
              ),
              Text("Dont have an account? "),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signup()));
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.purple),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
