import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: BottomAppBar(
        color: Color.fromARGB(160, 255, 255, 255),
        child: Text("Made with 💖 in MAHARASTRA version 1.0.0.1"),
      ),
    );
  }
}
