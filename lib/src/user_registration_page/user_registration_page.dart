import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:randevu/src/constants/config.dart';
import 'package:randevu/src/global_widgets/buttons_widget.dart';
import 'package:randevu/src/style.dart';
import 'package:string_validator/string_validator.dart';

class UserRegistrationPage extends StatefulWidget {
  static const routeName = '/login';
  final User? user;

  const UserRegistrationPage({Key? key, this.user}) : super(key: key);

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

  final database = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          isAlwaysShown: true,
          child: Container(
            margin: EdgeInsets.all(20),
            child: Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Expanded(
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
                                  labelText: 'My one link',
                                  prefixText: '$domainName/'),
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
                              maxLines: 2,
                              controller: _bioController,
                              decoration: bottomTextDecoration(
                                  labelText: 'Bio', hintText: 'Your Bio'),
                              onChanged: (value) {},
                              validator: (value) {},
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
                                  hintText:
                                      'https://facebook.com/facebook-page'),
                              onChanged: (value) {},
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  if (!isURL(value)) {
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
                                  if (!value.startsWith('@')) {
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
                                  if (!value.startsWith('@')) {
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
                                  if (!isURL(value)) {
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
                              controller: _youTubeController,
                              decoration: bottomTextDecoration(
                                  labelText: 'YouTube URL',
                                  hintText:
                                      'https://youtube.com/channel/yourchannel'),
                              onChanged: (value) {},
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  if (!isURL(value)) {
                                    return 'Please enter a valid Youtube channel URL';
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
                              controller: _linkedInController,
                              decoration: bottomTextDecoration(
                                  labelText: 'LinkedIn URL',
                                  hintText: 'https://linkedin.com/in/username'),
                              onChanged: (value) {},
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  if (!isURL(value)) {
                                    return 'Please enter a valid Linkedin profile URL';
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
                              controller: _clubHouseController,
                              decoration: bottomTextDecoration(
                                  labelText: 'Clubhouse URL',
                                  hintText: 'https://clubhouse.com/@username'),
                              onChanged: (value) {},
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  if (!isURL(value)) {
                                    return 'Please enter a valid Clubhouse profile URL';
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
                              controller: _whatsappController,
                              keyboardType: TextInputType.phone,
                              decoration: bottomTextDecoration(
                                  labelText: 'WhatsApp', hintText: '+00000000'),
                              onChanged: (value) {},
                              // validator: (value) {
                              //   if (value != null && value.isNotEmpty) {
                              //     if (!isAlphanumeric(value)) {
                              //       return 'Please enter a valid WhatsApp Number';
                              //     }
                              //     return null;
                              //   }
                              // },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: TextFormField(
                              controller: _telegramController,
                              decoration: bottomTextDecoration(
                                  labelText: 'Telegram URL',
                                  hintText: 'https://t.me/'),
                              onChanged: (value) {},
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  if (!isURL(value)) {
                                    return 'Please enter a valid Telegram URL';
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
                              controller: _tikTokController,
                              decoration: bottomTextDecoration(
                                  labelText: 'TikTok Username',
                                  hintText: '@tittokusername'),
                              onChanged: (value) {},
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  if (!value.startsWith('@')) {
                                    return 'Please enter a valid TikTok Username';
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
                              controller: _twitchController,
                              decoration: bottomTextDecoration(
                                  labelText: 'Twitch URL',
                                  hintText: 'https://twitch.tv/'),
                              onChanged: (value) {},
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  if (!isURL(value)) {
                                    return 'Please enter a valid Twitch URL';
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
                              controller: _appleAppStoreController,
                              decoration: bottomTextDecoration(
                                  labelText: 'Apple App Store URL',
                                  hintText:
                                      'https://apps.apple.com/us/yourapp/id32323'),
                              onChanged: (value) {},
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  if (!isURL(value)) {
                                    return 'Please enter a valid AppStore URL';
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
                              controller: _androidPlayStoreController,
                              decoration: bottomTextDecoration(
                                  labelText: 'Android App Store URL',
                                  hintText:
                                      'https://play.google.com/store/apps/details?id'),
                              onChanged: (value) {},
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  if (!isURL(value)) {
                                    return 'Please enter a valid Android App Store URL';
                                  }
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 60,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: GeneralButton(
                                  text: 'Cancel',
                                  color: Colors.red,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 3,
                              child: GeneralButton(
                                  text: 'Save',
                                  onPressed: () {
                                    _formKey.currentState!.validate();
                                    database
                                        .reference()
                                        .child('users')
                                        .child(widget.user!.uid)
                                        .child('profile')
                                        .set({
                                      'link': _urlController.text.isNotEmpty
                                          ? siteUrl + _urlController.text
                                          : null,
                                      'name': _nameController.text.isNotEmpty
                                          ? _nameController.text
                                          : null,
                                      'bio': _bioController.text.isNotEmpty
                                          ? _bioController.text
                                          : null,
                                      'email': _emailController.text.isNotEmpty
                                          ? _emailController.text
                                          : null,
                                      'facebook':
                                          _facebookController.text.isNotEmpty
                                              ? _facebookController.text
                                              : null,
                                      'instagram':
                                          _instagramController.text.isNotEmpty
                                              ? _instagramController.text
                                              : null,
                                      'twitter':
                                          _twitterController.text.isNotEmpty
                                              ? _twitterController.text
                                              : null,
                                      'youtube':
                                          _youTubeController.text.isNotEmpty
                                              ? _youTubeController.text
                                              : null,
                                      'snapchat':
                                          _snapChatController.text.isNotEmpty
                                              ? _snapChatController.text
                                              : null,
                                      'github':
                                          _githubController.text.isNotEmpty
                                              ? _githubController.text
                                              : null,
                                      'linkedin':
                                          _linkedInController.text.isNotEmpty
                                              ? _linkedInController.text
                                              : null,
                                      'clubhouse':
                                          _clubHouseController.text.isNotEmpty
                                              ? _clubHouseController.text
                                              : null,
                                      'whatsapp':
                                          _whatsappController.text.isNotEmpty
                                              ? _whatsappController.text
                                              : null,
                                      'telegram':
                                          _telegramController.text.isNotEmpty
                                              ? _telegramController.text
                                              : null,
                                      'tiktok':
                                          _tikTokController.text.isNotEmpty
                                              ? _tikTokController.text
                                              : null,
                                      'twitch':
                                          _twitchController.text.isNotEmpty
                                              ? _twitchController.text
                                              : null,
                                      'appleAppStore': _appleAppStoreController
                                              .text.isNotEmpty
                                          ? _appleAppStoreController.text
                                          : null,
                                      'androidAppStore':
                                          _androidPlayStoreController
                                                  .text.isNotEmpty
                                              ? _androidPlayStoreController.text
                                              : null,
                                    }).then((_) => debugPrint('done'));
                                  }),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
