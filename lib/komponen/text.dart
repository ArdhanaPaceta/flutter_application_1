import 'package:flutter/material.dart';

class TeksWidget extends StatelessWidget {
  const TeksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Belajar Flutter || Kelas 2B',
    style: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: Colors.amber
    ),);
  }
}