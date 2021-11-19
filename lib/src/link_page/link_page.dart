import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randevu/src/mock_data/mock_user_data.dart';

class LinkPage extends StatelessWidget {
  LinkPage({Key? key}) : super(key: key);
  final Color? _theColor = theMockUser.color != null
      ? Color(int.tryParse('0xFF' + theMockUser.color!)!)
      : Colors.red[800];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: _theColor,
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: _headerImage(),
          ),
          _body(context),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.07,
              right: 10,
              left: 10,
              child: _avatar()),
        ],
      ),
    );
  }

  Widget _avatar() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue[800],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 9,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
        border: Border.all(
          color: Colors.white,
          width: 4,
        ),
        image: DecorationImage(
          image: NetworkImage(theMockUser.avatar ?? ''),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _headerImage() {
    return Container(
      child: Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.red[800],
              image: DecorationImage(
                image: NetworkImage(theMockUser.header ?? ''),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  _theColor!,
                  _theColor!.withOpacity(0.7),
                  _theColor!.withOpacity(0.5),
                  _theColor!.withOpacity(0.2),
                  _theColor!.withOpacity(0.0),
                  _theColor!.withOpacity(0.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _body(context) {
    return Container(
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.8,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  SizedBox(height: 90),
                  Text(
                    theMockUser.name?.toUpperCase() ??
                        'the User Name'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: GoogleFonts.aBeeZee().fontFamily,
                    ),
                  ),
                  const Text(
                    'LinkPage',
                    style: TextStyle(fontSize: 24),
                  ),
                  const Text(
                    'LinkPage',
                    style: TextStyle(fontSize: 24),
                  ),
                  const Text(
                    'LinkPage',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
