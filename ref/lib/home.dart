import "learn_flutter.dart";
import "package:flutter/material.dart";

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return const learn_flutter();
        }));
      },
      child: const Text('learn_Flutter'),
    ));
  }
}
