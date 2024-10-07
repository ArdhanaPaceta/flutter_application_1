import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Contoh Date Picker',
      home: MyHomePage(title: 'Contoh Date Picker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Variable/State untuk menyimpan tanggal yang dipilih
  DateTime selectedDate = DateTime.now();

  // Fungsi untuk membuka DatePicker dan mengupdate state
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              // Menampilkan tanggal yang dipilih dengan format yang rapi
              "${selectedDate.toLocal()}".split(' ')[0],
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                _selectDate(context); // Memanggil fungsi DatePicker
              },
              child: const Text('Pilih Tanggal'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Menampilkan tanggal yang dipilih di console
                print(
                    "Tanggal yang dipilih: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}");
              },
              child: const Text('Print Tanggal'),
            ),
          ],
        ),
      ),
    );
  }
}
