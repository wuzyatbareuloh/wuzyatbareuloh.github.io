//import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'dart:math' as math;
import 'dart:async';
import 'dart:ui';

import 'textfield_widget.dart';

import '../services/feedback_form.dart';
import '../services/controller.dart';

//import 'dart:ui' as ui;

class nonMainPageFooter extends StatefulWidget {
  const nonMainPageFooter({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<nonMainPageFooter> createState() => _nonMainPageFooterState();
}

class _nonMainPageFooterState extends State<nonMainPageFooter> {
  late bool isButtonClicked;
  late String userInputEmail;

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }

  void _submitForm(String email, String timeStamp) {
    FeedbackForm feedbackForm = FeedbackForm(email, timeStamp);

    FormController formController = FormController((String response) {
      print(response);
    });

    formController.submitForm(feedbackForm);
  }

  @override
  void initState() {
    super.initState();

    isButtonClicked = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1.5,
          color: const Color.fromRGBO(26, 26, 255, 1.0),
          child: const Divider(
            color: Colors
                .transparent, // Set the color of the Divider to transparent
            height: 0,
          ),
        ),
        Container(
          color: const Color.fromRGBO(26, 26, 255, 1.0),
          child: Column(
            children: [
              const SizedBox(height: 100.0),
              Image.asset(
                'assets/footerLogo.png',
                width: math.max(
                    math.min(
                        math.max(
                            MediaQuery.of(context).size.width * 0.2, 165.0),
                        270.0),
                    190),
              ),
              const SizedBox(height: 25.0),
              const SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        Uri _url = Uri.parse(
                            'https://www.instagram.com/bareulohsounds');
                        if (!(await launchUrl(_url))) {
                          throw 'Could not launch $_url';
                        }
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 18,
                            child: Image.asset('assets/instagram.png'),
                          ),
                          Text(
                            ' bareulohsounds',
                            style: TextStyle(
                              fontFamily: 'Thonburi',
                              fontSize: 13,
                              color: const Color(0xffFFFFFF).withOpacity(0.9),
                              fontWeight: FontWeight.bold,
                              //letterSpacing: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 9.0),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        Uri _url =
                            Uri.parse('https://www.instagram.com/wuzy.wav');
                        if (!(await launchUrl(_url))) {
                          throw 'Could not launch $_url';
                        }
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 18,
                            child: Image.asset('assets/instagram.png'),
                          ),
                          Text(
                            ' wuzy.wav',
                            style: TextStyle(
                              fontFamily: 'Thonburi',
                              fontSize: 13,
                              color: const Color(0xffFFFFFF).withOpacity(0.9),
                              fontWeight: FontWeight.bold,
                              //letterSpacing: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 9.0),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        Uri _url = Uri.parse(
                            'https://www.instagram.com/clouds_in_seoul');
                        if (!(await launchUrl(_url))) {
                          throw 'Could not launch $_url';
                        }
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 18,
                            child: Image.asset('assets/instagram.png'),
                          ),
                          Text(
                            ' clouds_in_seoul',
                            style: TextStyle(
                              fontFamily: 'Thonburi',
                              fontSize: 13,
                              color: const Color(0xffFFFFFF).withOpacity(0.9),
                              fontWeight: FontWeight.bold,
                              //letterSpacing: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              /*
                Text(
                  'KEEP UP WITH US',
                  style: TextStyle(
                    fontFamily: 'Thonburi',
                    fontSize: 15,
                    color: const Color(0xffFFFFFF).withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                */
              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width < 600
                        ? 95
                        : MediaQuery.of(context).size.width * 0.30,
                  ),
                  Expanded(
                    child: TextFieldWidget(
                      //hintTextFor: 'First name, nickname, full name, whatever ',
                      //label: '',
                      text: 'Get email updates from us!',
                      //hintTextFor: 'Sign up with your email',
                      //onChanged: (name) => _user = _user.copy(name: name),

                      onChanged: (email) {
                        userInputEmail = email;
                      },
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 13.0),
                    child: OutlinedButton(
                      onPressed: () {
                        String postButtonClickEmail = userInputEmail;
                        if (_isValidEmail(postButtonClickEmail)) {
                          print('true');

                          // google sheets app script form
                          _submitForm(
                              postButtonClickEmail, DateTime.now().toString());

                          setState(() {
                            isButtonClicked = true;
                          });

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(""),
                                content: const Text(
                                  "Thank you for signing up for our email updates :)",
                                  style: TextStyle(
                                    fontFamily: 'Thonburi',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    child: const Text(
                                      "yay",
                                      style: TextStyle(
                                        fontFamily: 'Thonburi',
                                        fontSize: 13,
                                        color:
                                            Color.fromRGBO(126, 126, 245, 1.0),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(BorderSide(
                          color: const Color(0xffFFFFFF).withOpacity(0.9),
                        )), // Set the border color to white
                        backgroundColor: MaterialStateProperty.all(Colors
                            .transparent), // Make the background transparent
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontFamily: 'Thonburi',
                          fontSize: 13,
                          color: const Color(0xffFFFFFF).withOpacity(0.9),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width < 600
                        ? 95
                        : MediaQuery.of(context).size.width * 0.30,
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 25.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "© ${DateTime.now().year} 👨‍💻 Wuzy & 🧠 Clouds in Seoul & 🎨 Jadujam",
                          style: TextStyle(
                            fontFamily: 'Thonburi',
                            fontSize: 11,
                            color: const Color(0xffFFFFFF).withOpacity(0.8),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Add more TextSpans for different parts if necessary
                      ],
                    ),
                  ),
                ),
              ),
/*
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 25.0),
                  child: Text(
                    "© 20xx 👨‍💻 Wuzy & 🧠 Clouds in Seoul & 🎨 Jadujam"
                        .replaceAll("20xx", DateTime.now().year.toString()),
                    style: TextStyle(
                      fontFamily: 'Thonburi',
                      fontSize: 11,
                      color: const Color(0xffFFFFFF).withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              */
              const SizedBox(height: 60.0),
            ],
          ),
        ),
      ],
    );
  }
}
