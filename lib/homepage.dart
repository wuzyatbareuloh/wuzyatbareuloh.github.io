//import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
//import 'package:web/controllerForTimeStamp.dart';

import 'dart:math';
import 'dart:async';
import 'dart:ui';

import './textfield_widget.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import './feedback_form.dart';
import './controller.dart';

import './visitorTimeStamp.dart';
import './controllerForTimeStamp.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_animate/flutter_animate.dart';

import './nonMainPageFooter.dart';

//import 'dart:ui' as ui;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late bool isButtonClicked;

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

  void _submitTimeStamp(String visitedWhen) {
    VisitorTimeStampForm visitorTimeStampForm =
        VisitorTimeStampForm(visitedWhen);

    ControllerForTimeStamp controllerForTimeStamp =
        ControllerForTimeStamp((String response) {
      print(response);
    });

    controllerForTimeStamp.submitTimeStampForm(visitorTimeStampForm);
  }

  late String userInputEmail;

  @override
  void initState() {
    // for the rotating circle
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 204))
          ..repeat();

    isButtonClicked = false;

    _submitTimeStamp(DateTime.now().toString());
  }

  @override
  void dispose() {
    // for the rotating circle
    _controller.dispose();

    //_timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: <Widget>[
          //container added for static effect
          Animate(
            effects: const [
              FadeEffect(duration: Duration(seconds: 3)),
            ],
            child: Material(
              //color: Colors.transparent,

              child: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/texture1.jpeg"),
                    fit: BoxFit.cover,
                  ),
                  gradient: RadialGradient(
                    center: const Alignment(0.5, 0.5),
                    radius: MediaQuery.of(context).size.height * 0.7,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
                    stops: const [0.5, 1.0],
                  ),
                ),
              ),
            ),
          ),

          //container added for static effect
          Animate(
            effects: const [
              FadeEffect(duration: Duration(seconds: 4)),
            ],
            child: Container(
              color: Colors.transparent,
              child: const Opacity(
                opacity: 0.021,
                child: Image(
                  image: AssetImage('assets/static3.png'),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.topLeft,
                ),
              ),
            ),
          ),

          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 30.0, top: 40.0, right: 30.0),
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Animate(
                      effects: const [
                        FadeEffect(duration: Duration(seconds: 4)),
                      ],
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () async {
                            context.go('/'); // push named route
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          child: SizedBox(
                            width: (MediaQuery.of(context).size.width * (0.2))
                                .clamp(170.0, 270.0),
                            child: Image.asset('assets/logo.png'),
                          ),
                        ),
                      ),
                    ),
                    Animate(
                      effects: const [
                        FadeEffect(duration: Duration(seconds: 3)),
                      ],
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () async {
                            context.go('/artists'); // push named route
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          child: SizedBox(
                            height: ((MediaQuery.of(context).size.width * (0.2))
                                    .clamp(170.0, 270.0)) *
                                30 /
                                406,
                            child: Image.asset('artists1_5x.png'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              Expanded(
                child: SingleChildScrollView(
                  //controller: _scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 45.0),
                      Animate(
                        effects: const [
                          FadeEffect(duration: Duration(seconds: 6)),
                        ],
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            final screenWidth = constraints.maxWidth;

                            // Define a threshold width for switching between horizontal and vertical layouts
                            const thresholdWidth = 600;

                            if (screenWidth < thresholdWidth) {
                              // Stacking vertically
                              return Column(
                                children: [
                                  Column(
                                    children: [
                                      Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () async {
                                            context.go('/patient');
                                          },
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          child: Container(
                                            height: (((MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.7) *
                                                        1.1)
                                                    .clamp(5, 800)) *
                                                0.38,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.asset(
                                                  'assets/patientCoverPhoto.jpg'),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15.0),
                                      const Text(
                                        'Patient (Wuzy)',
                                        style: TextStyle(
                                          fontFamily: 'Thonburi',
                                          fontSize: 19,
                                          color: Color(0xffFFFFFF),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 15.0),
                                    ],
                                  ),
                                  const SizedBox(
                                      height:
                                          66), // Add spacing between the stacked elements
                                  Column(
                                    children: [
                                      Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () async {
                                            context.go('/cloudsinseoul');
                                          },
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          child: Container(
                                            height: (((MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.7) *
                                                        1.1)
                                                    .clamp(5, 1200)) *
                                                0.38,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.asset(
                                                  'assets/CloudsInSeoulZero.png'),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15.0),
                                      const Text(
                                        '0 (Clouds in Seoul)',
                                        style: TextStyle(
                                          fontFamily: 'Thonburi',
                                          fontSize: 19,
                                          color: Color(0xffFFFFFF),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 15.0),
                                    ],
                                  ),
                                ],
                              );
                            } else {
                              // Stacking horizontally
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      const SizedBox(height: 15.0),
                                      Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () async {
                                            context.go('/patient');
                                          },
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          child: Container(
                                            height: (((MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.7) *
                                                        1.1)
                                                    .clamp(5, 900)) *
                                                0.38,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.asset(
                                                  'assets/patientCoverPhoto.jpg'),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15.0),
                                      const Text(
                                        'Patient (Wuzy)',
                                        style: TextStyle(
                                          fontFamily: 'Thonburi',
                                          fontSize: 21,
                                          color: Color(0xffFFFFFF),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 15.0),
                                    ],
                                  ),

                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .16), // Add spacing between the horizontally stacked elements
                                  Column(
                                    children: [
                                      const SizedBox(height: 15.0),
                                      Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () async {
                                            context.go('/cloudsinseoul');
                                          },
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          child: Container(
                                            height: (((MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.7) *
                                                        1.1)
                                                    .clamp(5, 900)) *
                                                0.38,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.asset(
                                                  'assets/CloudsInSeoulZero.png'),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15.0),
                                      const Text(
                                        '0 (Clouds in Seoul)',
                                        style: TextStyle(
                                          fontFamily: 'Thonburi',
                                          fontSize: 21,
                                          color: Color(0xffFFFFFF),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 15.0),
                                    ],
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                      ),

                      /*
                      Center(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () async {
                              Uri _url = Uri.parse('https://tr.ee/OOZwLb21sl');
                              if (!(await launchUrl(_url))) {
                                throw 'Could not launch $_url';
                              }
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            child: RotationTransition(
                              turns: Tween(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                  parent: _controller,
                                  curve: Curves.linear,
                                ),
                              ),
                              child: SizedBox(
                                width:
                                    MediaQuery.of(context).size.height * (0.3),
                                height:
                                    MediaQuery.of(context).size.height * (0.3),
                                // made collage using photojoiner.com
                                // then fisheye effect via https://www3.lunapic.com/editor/?action=fisheye
                                child: Image.asset(
                                    'assets/rotationCenterCollage2.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      */
                      const SizedBox(height: 230.0),
                      const nonMainPageFooter(title: 'footer'),
                    ],
                  ),
                ),
              ),
            ],
          ),

          /*
          const Center(
            child: Text("Hello background"),
          ),
          */
        ],
      ),
    ));
  }
}
