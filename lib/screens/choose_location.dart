import 'package:flutter/material.dart';

class ChooseLocationScreen extends StatefulWidget {
  const ChooseLocationScreen({Key? key}) : super(key: key);

  @override
  State<ChooseLocationScreen> createState() => _ChooseLocationScreenState();
}

class _ChooseLocationScreenState extends State<ChooseLocationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Choose Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: Colors.grey,
      body: ElevatedButton(
          onPressed: () {},
          child: const Text('Click me'),
      ),
    );
  }
}
