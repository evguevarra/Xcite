import 'package:flutter/material.dart';

class CountDownViewPage extends StatefulWidget {
  final String title;
  const CountDownViewPage({Key? key, required this.title}) : super(key: key);

  @override
  _CountDownViewPageState createState() => _CountDownViewPageState();
}

class _CountDownViewPageState extends State<CountDownViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade200,
        title: Text(
          widget.title,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
            ),
          )
        ],
      ),
      body: const Center(
        child: Text('Put timer here'),
      ),
    );
  }
}
