import 'package:flutter/material.dart';

class DefaultView extends StatelessWidget {
  const DefaultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Flutter'),
      ),
      body: const Center(
        child: Text('Default View'),
      ),
    );
  }
}
