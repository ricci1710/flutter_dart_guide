import 'package:flutter/material.dart';

class Section4MainApp extends StatelessWidget {
  const Section4MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: Section4HomePage(),
    );
  }
}

class Section4HomePage extends StatelessWidget {
  const Section4HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: const Card(
              color: Colors.blue,
              elevation: 5,
              child: Text('CHART!'),
            ),
          ),
          const Card(
            child: Text('LIST OF TX'),
          ),
        ],
      ),
    );
  }
}
