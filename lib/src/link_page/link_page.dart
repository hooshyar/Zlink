import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:randevu/src/mock_data/mock_user_data.dart';
import 'package:randevu/src/widgets/button_widgets/button_elevated_style1.dart';
import 'package:randevu/src/widgets/button_widgets/button_outlined_t1.dart';

class LinkPage extends StatefulWidget {
  static const routeName = '/linkPage';
  LinkPage({Key? key}) : super(key: key);

  @override
  State<LinkPage> createState() => _LinkPageState();
}

class _LinkPageState extends State<LinkPage> {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: _avatar()),
                ],
              ),
              left: 30,
              right: 30),
        ],
      ),
    );
  }

  Widget _avatar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            //some other box

            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Icon(
                //   Icons.remove_red_eye_outlined,
                //   color: Colors.grey[800],
                //   size: 20,
                // ),

                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  child: LikeButton(
                    size: 24,
                    circleColor: CircleColor(
                        start: Color(0xff00ddff), end: Color(0xff0099cc)),
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: Color(0xff33b5e5),
                      dotSecondaryColor: Color(0xff0099cc),
                    ),
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        FontAwesomeIcons.solidHeart,
                        color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                        size: 18,
                      );
                    },
                    likeCount: theMockUser.fans ?? 0,
                    countBuilder: (int? count, bool isLiked, String? text) {
                      var color =
                          isLiked ? Colors.deepPurpleAccent : Colors.grey;
                      Widget result;
                      if (count == 0) {
                        result = Text(
                          "0",
                          style: TextStyle(color: color),
                        );
                      } else
                        result = Text(
                          '000',
                          style: TextStyle(color: color),
                        );
                      return result;
                    },
                  ),
                )),
              ],
            ),
          ),
        ),
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.blue[800],
            borderRadius: BorderRadius.circular(50),
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
        ),
        Expanded(
          child: Container(
            //counter box

            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.remove_red_eye_outlined,
                  color: Colors.grey[800],
                  size: 18,
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  child: Text(
                    '${theMockUser.views ?? 0}',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
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
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.8,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 90),
                  SelectableText(
                    theMockUser.name ?? 'the User Name',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: GoogleFonts.aBeeZee().fontFamily,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: SelectableText(
                      theMockUser.info ?? 'the User Bio',
                      minLines: 2,
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        overflow: TextOverflow.fade,
                        fontFamily: GoogleFonts.aBeeZee().fontFamily,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView(children: [
                      OutlinedButtonStyle1(
                        text: 'Website',
                        borderColor: Colors.red[800],
                        textColor: Colors.grey[800],
                        onPressed: () {
                          print('Website');
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      OutlinedButtonStyle1(
                        text: 'Website',
                        borderWidth: 2,
                        borderColor: Colors.blue[800],
                        textColor: Colors.blue[800],
                        onPressed: () {
                          print('Website');
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      OutlinedButtonStyle1(
                        text: 'Website',
                        borderWidth: 2,
                        borderColor: Colors.blue[800],
                        textColor: Colors.red,
                        onPressed: () {
                          print('Website');
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ButtonElevatedStyle1(
                        text: 'Instagram',
                        icon: FontAwesomeIcons.instagram,
                        bgColor: Colors.red[800],
                        textColor: Colors.white,
                        onPressed: () {
                          print('Instagram');
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ButtonElevatedStyle1(
                        text: 'Facebook',
                        icon: FontAwesomeIcons.facebook,
                        bgColor: Colors.blue[800],
                        textColor: Colors.white,
                        onPressed: () {
                          print('Facebook');
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ButtonElevatedStyle1(
                        text: 'Twitter',
                        icon: FontAwesomeIcons.facebook,
                        bgColor: Colors.blue[800],
                        textColor: Colors.white,
                        onPressed: () {
                          print('Twitter');
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ButtonElevatedStyle1(
                        text: 'LinkedIn',
                        icon: FontAwesomeIcons.facebook,
                        bgColor: Colors.blue[800],
                        textColor: Colors.white,
                        onPressed: () {
                          print('LinkedIn');
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ButtonElevatedStyle1(
                        text: 'Youtube',
                        icon: FontAwesomeIcons.facebook,
                        bgColor: Colors.blue[800],
                        textColor: Colors.white,
                        onPressed: () {
                          print('Youtube');
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ButtonElevatedStyle1(
                        text: 'Github',
                        icon: FontAwesomeIcons.facebook,
                        bgColor: Colors.blue[800],
                        textColor: Colors.white,
                        onPressed: () {
                          print('Github');
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ButtonElevatedStyle1(
                        text: 'Github',
                        icon: FontAwesomeIcons.facebook,
                        bgColor: Colors.blue[800],
                        textColor: Colors.white,
                        onPressed: () {
                          print('Github');
                        },
                      ),
                    ]),
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
