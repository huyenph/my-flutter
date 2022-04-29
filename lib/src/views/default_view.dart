import 'package:flutter/material.dart';

class DefaultView extends StatelessWidget {
  const DefaultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Flutter'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/auth-home'),
              child: const Text('Authentication'),
            ),
          ],
        ),
      ),
    );
  }
}
