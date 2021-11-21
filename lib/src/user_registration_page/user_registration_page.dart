import 'package:flutter/material.dart';
import 'package:randevu/src/constants/config.dart';
import 'package:randevu/src/style.dart';
import 'package:string_validator/string_validator.dart';

class UserRegistrationPage extends StatefulWidget {
  static const routeName = '/login';

  const UserRegistrationPage({Key? key}) : super(key: key);

  @override
  State<UserRegistrationPage> createState() => _UserRegistrationPageState();
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  //name controller
  TextEditingController _nameController = TextEditingController();
  //url controller
  TextEditingController _urlController = TextEditingController();
  //email controller
  TextEditingController _emailController = TextEditingController();
  //facebook controller
  TextEditingController _facebookController = TextEditingController();
  //twitter controller
  TextEditingController _twitterController = TextEditingController();
  //instagram controller
  TextEditingController _instagramController = TextEditingController();
  //youTube controller
  TextEditingController _youTubeController = TextEditingController();
  //linkedIn  controller
  TextEditingController _linkedInController = TextEditingController();
  //clubHouse controller
  TextEditingController _clubHouseController = TextEditingController();
  //whatsapp controller
  TextEditingController _whatsappController = TextEditingController();
  //telegram url
  TextEditingController _telegramController = TextEditingController();
  //snapChat url
  TextEditingController _snapChatController = TextEditingController();
  //tikTok  url
  TextEditingController _tikTokController = TextEditingController();
  //signal url
  TextEditingController _signalController = TextEditingController();
  //twitch url
  TextEditingController _twitchController = TextEditingController();
  //patreon url
  TextEditingController _patreonController = TextEditingController();
  //pintrest url
  TextEditingController _pintrestController = TextEditingController();
  //spotify url
  TextEditingController _spotifyController = TextEditingController();
  //apple App Store url
  TextEditingController _appleAppStoreController = TextEditingController();
  //android Play Store url
  TextEditingController _androidPlayStoreController = TextEditingController();
  //github controller
  TextEditingController _githubController = TextEditingController();
  //bio controller
  TextEditingController _bioController = TextEditingController();

  String? profileImgUrl;
  //form Key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Center(
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Text('User Registration Page'),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      controller: _urlController,
                      decoration: bottomTextDecoration(
                          labelText: 'My One Link', prefixText: '$domainName/'),
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      controller: _nameController,
                      decoration: bottomTextDecoration(
                          labelText: 'Name', hintText: 'Your name '),
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: bottomTextDecoration(
                          labelText: 'Email Address',
                          hintText: 'Your-name@gmail.com'),
                      onChanged: (value) {},
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          if (!isEmail(value)) {
                            return 'Please enter a valid email address';
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      controller: _facebookController,
                      decoration: bottomTextDecoration(
                          labelText: 'Facebook Page',
                          hintText: 'https://facebook.com/facebook-page'),
                      onChanged: (value) {},
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          if (value.startsWith('https://facebook') ||
                              value.startsWith('https://wwww.facebook')) {
                            return 'Please enter a valid Facebook page';
                          }
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      controller: _twitterController,
                      decoration: bottomTextDecoration(
                          labelText: 'Twitter Handle',
                          hintText: '@yourtwitterhandle'),
                      onChanged: (value) {},
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          if (value.startsWith('@')) {
                            return 'Please enter a valid Twitter handle';
                          }
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      controller: _instagramController,
                      decoration: bottomTextDecoration(
                          labelText: 'Instagram Username',
                          hintText: '@Instagram '),
                      onChanged: (value) {},
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          if (value.startsWith('@')) {
                            return 'Please enter a valid Instagram Username';
                          }
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      controller: _snapChatController,
                      decoration: bottomTextDecoration(
                          labelText: 'Snapchat URL',
                          hintText:
                              'https://www.snapchat.com/add/yourusername'),
                      onChanged: (value) {},
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          if (value.startsWith('https://www.snapchat') ||
                              value.startsWith('https://snapchat')) {
                            return 'Please enter a valid Snapchat URL';
                          }
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      controller: _snapChatController,
                      decoration: bottomTextDecoration(
                          labelText: 'Snapchat URL',
                          hintText:
                              'https://www.snapchat.com/add/yourusername'),
                      onChanged: (value) {},
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          if (value.startsWith('@')) {
                            return 'Please enter a valid Snapchat URL';
                          }
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
