import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:randevu/src/global_widgets/logo_widget.dart';
import 'package:randevu/src/style.dart';
import 'package:randevu/src/user_registration_page/user_registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPin = false; // show pin or not
  String? _verificationID, smsCode;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: const LogoWidget(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context)
              .requestFocus(FocusNode()); // to hide keyboard on tap outside
        },
        child: SizedBox(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      Lottie.asset(
                        'assets/animations/login_page_animation.json',
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 200,
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.all(20),
                        child: const Text(
                          'Nostrud nisi fugiat non Lorem reprehenderit. Culpa est nisi duis laborum tempor cupidatat occaecat dolore.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                AnimatedCrossFade(
                    alignment: Alignment.bottomCenter,
                    firstChild: _phoneInput(),
                    secondChild: _pinInput(),
                    sizeCurve: Curves.easeInCirc,
                    crossFadeState: _showPin == false
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 300)),
                SafeArea(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          child: const Text('Privacy Policy',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12)),
                          onPressed: () {},
                        ),
                        TextButton(
                          child: const Text('Terms of Service',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12)),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _phoneInput() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 90,
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: generalTextDecoration(
                labelText: 'Phone Number', prefixText: '+964'),
            onChanged: (value) {},
          ),
        ),
        SizedBox(
          child: MaterialButton(
              minWidth: 260,
              height: 52,
              color: Colors.black,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text('Login'),
              onPressed: () async {
                if (_phoneController.text.isEmpty) {
                  return;
                }
                await _auth.verifyPhoneNumber(
                  phoneNumber: '+964' +
                      _phoneController
                          .text, //this is a test number, should get from the input
                  codeSent: (String verificationId, int? forceResendingToken) {
                    //sshow pin input
                    setState(() {
                      _showPin = true;
                      _verificationID = verificationId;
                    });
                    //please input the pin
                  },
                  verificationCompleted: (AuthCredential credential) {
                    //sign in with credentials
                  },
                  verificationFailed: (FirebaseAuthException exception) {},
                  codeAutoRetrievalTimeout: (String verificationId) {},
                );

                // }
              }),
        ),
      ],
    );
  }

  // if show pin is true, show pin input
  _pinInput() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(16),
          height: 90,
          child: PinCodeTextField(
            controller: _pinController,
            appContext: context,
            length: 6,
            autoFocus: true,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              fieldWidth: 40,
              fieldHeight: 50,
              inactiveColor: Colors.grey[300],
              activeColor: Colors.black,
              errorBorderColor: Colors.red,
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              borderWidth: 0.7,
            ),
            onChanged: (String value) {},
            // onChanged: (value) {
            //   debugPrint('New value: $value');
            //   if (value.length == 6) {
            //     if (value == '888888') {
            //       debugPrint('Pin is correct');
            //       Navigator.of(context)
            //           .pushReplacementNamed(HomePage.routeName);
            //     }
            //     //for now no matter what just go to the home page
            //     Navigator.of(context)
            //         .pushReplacementNamed(HomePage.routeName);
            //   }
            // }
          ),
        ),
        SizedBox(
          child: MaterialButton(
              minWidth: 260,
              height: 52,
              color: mainColor,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text('Verify'),
              onPressed: () async {
                //todo check if pin is correct navigate to the HomeScreen else show error
                PhoneAuthCredential _phoneAuthCredential =
                    PhoneAuthProvider.credential(
                        verificationId: _verificationID!,
                        smsCode: _pinController.text);
                UserCredential _user =
                    await _auth.signInWithCredential(_phoneAuthCredential);
                debugPrint(_user.user!.phoneNumber.toString());
                if (_user.user != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserRegistrationPage(
                            user: _user.user,
                          )));
                }
                // Navigator.of(context).pushReplacementNamed(HomePage.routeName);
              }),
        ),
      ],
    );
  }
}
