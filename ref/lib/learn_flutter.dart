import 'package:flutter/material.dart';

class learn_flutter extends StatefulWidget {
  const learn_flutter({super.key});

  @override
  State<learn_flutter> createState() => _learn_flutterState();
}

class _learn_flutterState extends State<learn_flutter> {
  bool isbool = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn flutter'),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
              onPressed: () {
                debugPrint("actions");
              },
              icon: const Icon(Icons.abc_sharp))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'images/param.jpeg',
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black12,
            ),
            Container(
                margin: const EdgeInsets.all(50),
                color: const Color.fromARGB(255, 64, 239, 255),
                padding: EdgeInsets.all(20),
                child: const Center(
                  child: Text(
                    "This is text",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                width: double.infinity),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isbool ? Colors.green : Colors.blue,
                ),
                onPressed: () {
                  debugPrint("hello");
                },
                child: Text("elevated")),
            OutlinedButton(
                onPressed: () {
                  debugPrint("outline");
                },
                child: Text("outlined")),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                debugPrint("gesture this is the row");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.local_fire_department, color: Colors.blue),
                  const Icon(
                    Icons.local_fire_department,
                    color: Colors.blueGrey,
                  ),
                  Text(
                    "ROW",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            Switch(
                value: isbool,
                onChanged: (bool newbool) {
                  setState(() {
                    isbool = newbool;
                  });
                }),

            //same thing is with the checkbox
            //we use image.network for taking image from the internet

            Image.network(
                "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&w=400"),
          ],
        ),
//single childscrollview is used to add scrolling to the app
      ),
    );
  }
}
