import 'package:flutter/material.dart';

class LinkPage extends StatelessWidget {
  const LinkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // height: 500,
            color: Colors.blue[200],
          ),
          Container(
            child: Text(
              'LinkPage',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
