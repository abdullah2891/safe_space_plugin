import 'package:flutter/material.dart';

import 'package:safe_space_plugin/safe_space_landing_page.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: ExampleApp(),
  ));
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safe Space Example'),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            child: const Text('Launch Safe Space 1'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SafeSpaceLandingPage(param: 1)),
              );
            },
          ),
          ElevatedButton(
            child: const Text('Launch Safe Space 2'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SafeSpaceLandingPage(param: 2)),
              );
            },
          )
        ],
      )),
    );
  }
}
