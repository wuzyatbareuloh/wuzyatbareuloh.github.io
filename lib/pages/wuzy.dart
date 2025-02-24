//import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:web/universalComponents/colors.dart';

import 'dart:math';
import 'dart:async';
import 'dart:ui';

import '../universalComponents/textfield_widget.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../services/feedback_form.dart';
import '../services/controller.dart';

import '../universalComponents/nonMainPageFooter.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_animate/flutter_animate.dart';

import 'dart:io';

import 'package:flutter/services.dart';

import 'dart:html' as html;

//import 'dart:ui' as ui;

class WuzyPage extends StatefulWidget {
  const WuzyPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<WuzyPage> createState() => _WuzyPageState();
}

class _WuzyPageState extends State<WuzyPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  //for static effect
  late Timer _timer;

  ScrollController _scrollController = ScrollController();
  double _opacity = 0.0;

  DecorationImage darkenedImage = const DecorationImage(
    image: AssetImage("assets/texture1.jpeg"),
    fit: BoxFit.cover,
    colorFilter: ColorFilter.matrix([
      0.1, 0, 0, 0, 0, // Red channel
      0, 0.1, 0, 0, 0, // Green channel
      0, 0, 0.1, 0, 0, // Blue channel
      0, 0, 0, 1, 0, // Alpha channel
    ]),
  );

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

  late String userInputEmail;

  String whoIsWuzy = '';

  Future<void> _loadStrings() async {
    whoIsWuzy = await rootBundle.loadString('assets/content/wuzyPage.txt');
  }

  @override
  void initState() {
    // for the rotating circle
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 204))
          ..repeat();

    _scrollController.addListener(() {
      setState(() {
        _opacity = _scrollController.offset > 100.0 ? 1.0 : 0.0;
      });

      _loadStrings();
    });

    isButtonClicked = false;
  }

  @override
  void dispose() {
    // for the rotating circle
    _controller.dispose();

    _timer.cancel();

    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: "Wuzy @ Bareulohsounds",
        color: AppColors.wuzyBackground,
        child: Scaffold(
          backgroundColor: AppColors.wuzyBackground,
          body: SafeArea(
            child: Stack(
              children: <Widget>[
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 35.0, top: 20.0, right: 35.0),
                      child: Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () async {
                                context.go('/'); // push named route
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              child: SizedBox(
                                height: (((MediaQuery.of(context).size.width *
                                            (0.2))
                                        .clamp(170.0, 270.0)) *
                                    70 /
                                    394),
                                child: ColorFiltered(
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.bareulohBlack, // Desired color
                                    BlendMode.srcIn, // Blend mode
                                  ),
                                  child: Image.asset('assets/logoSymbol.png'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 45.0),
                            Animate(
                              effects: const [
                                FadeEffect(duration: Duration(seconds: 3)),
                              ],
                              child: SizedBox(
                                width:
                                    ((MediaQuery.of(context).size.width * (0.7))
                                        .clamp(10, 220)),
                                child: Image.asset('assets/wuzyTempPic.png'),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Animate(
                              effects: const [
                                FadeEffect(duration: Duration(seconds: 4)),
                              ],
                              child: const Text(
                                'Wuzy',
                                style: TextStyle(
                                  fontFamily: 'Thonburi-Bold',
                                  fontSize: 29,
                                  color: AppColors.bareulohBlack,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Animate(
                              effects: const [
                                FadeEffect(duration: Duration(seconds: 5)),
                              ],
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () async {
                                        Uri _url = Uri.parse(
                                            'https://open.spotify.com/artist/6nbGWBfGkNxbu0Hw3FccOZ?si=FiviagKySSqP8xCIYiLjzQ');
                                        if (!(await launchUrl(_url))) {
                                          throw 'Could not launch $_url';
                                        }
                                      },
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      child: SizedBox(
                                        height: 23,
                                        child: ColorFiltered(
                                          colorFilter: const ColorFilter.mode(
                                            AppColors
                                                .bareulohBlack, // Desired color
                                            BlendMode.srcIn, // Blend mode
                                          ),
                                          child:
                                              Image.asset('assets/spotify.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14.0),
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () async {
                                        Uri _url = Uri.parse(
                                            'https://music.apple.com/us/artist/wuzy/1450472293');
                                        if (!(await launchUrl(_url))) {
                                          throw 'Could not launch $_url';
                                        }
                                      },
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      child: SizedBox(
                                        height: 23,
                                        child: ColorFiltered(
                                          colorFilter: const ColorFilter.mode(
                                            AppColors
                                                .bareulohBlack, // Desired color
                                            BlendMode.srcIn, // Blend mode
                                          ),
                                          child: Image.asset(
                                              'assets/applemusic.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14.0),
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () async {
                                        Uri _url = Uri.parse(
                                            'https://www.instagram.com/wuzy.wav');
                                        if (!(await launchUrl(_url))) {
                                          throw 'Could not launch $_url';
                                        }
                                      },
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      child: SizedBox(
                                        height: 23,
                                        child: ColorFiltered(
                                          colorFilter: const ColorFilter.mode(
                                            AppColors
                                                .bareulohBlack, // Desired color
                                            BlendMode.srcIn, // Blend mode
                                          ),
                                          child: Image.asset(
                                              'assets/instagram.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14.0),
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () async {
                                        Uri _url = Uri.parse(
                                            'https://www.tiktok.com/@wuzy.wav');
                                        if (!(await launchUrl(_url))) {
                                          throw 'Could not launch $_url';
                                        }
                                      },
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      child: SizedBox(
                                        height: 23,
                                        child: ColorFiltered(
                                          colorFilter: const ColorFilter.mode(
                                            AppColors
                                                .bareulohBlack, // Desired color
                                            BlendMode.srcIn, // Blend mode
                                          ),
                                          child:
                                              Image.asset('assets/tiktok.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14.0),
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () async {
                                        Uri _url = Uri.parse(
                                            'https://www.youtube.com/@wuzy_wav');
                                        if (!(await launchUrl(_url))) {
                                          throw 'Could not launch $_url';
                                        }
                                      },
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      child: SizedBox(
                                        height: 23,
                                        child: ColorFiltered(
                                          colorFilter: const ColorFilter.mode(
                                            AppColors
                                                .bareulohBlack, // Desired color
                                            BlendMode.srcIn, // Blend mode
                                          ),
                                          child:
                                              Image.asset('assets/youtube.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 50.0),
                            Animate(
                              effects: const [
                                FadeEffect(duration: Duration(seconds: 5)),
                              ],
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors
                                      .transparent, // Changed to fully transparent
                                  borderRadius: BorderRadius.circular(
                                      10), // Adjust the radius for the desired roundness
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[500]!.withOpacity(
                                          0.0), // Reduced opacity or remove for no shadow
                                      blurRadius: 0, // Reduce or remove blur
                                      spreadRadius:
                                          0, // Reduce or remove spread
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      10), // Match the borderRadius of the container
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 0,
                                        sigmaY:
                                            0), // Adjust or remove for less/more blur
                                    child: Container(
                                      padding: const EdgeInsets.all(18.0),
                                      color: Colors
                                          .transparent, // Ensure the inner container is also transparent
                                      child: SizedBox(
                                        width: (((MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.7) *
                                                1.1)
                                            .clamp(5, 600)),
                                        child: AnimatedOpacity(
                                          opacity: _opacity,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          child: Text(
                                            whoIsWuzy,
                                            style: const TextStyle(
                                              fontFamily: 'Thonburi',
                                              fontSize: 15,
                                              color: AppColors.bareulohBlack,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 50.0),
                            const SizedBox(height: 30.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () async {
                                          context.go('/notahomewithoutyou');
                                        },
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        child: SizedBox(
                                          height: (((MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.7) *
                                                      1.1)
                                                  .clamp(5, 600)) *
                                              .38,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  spreadRadius: 2,
                                                  blurRadius: 4,
                                                  offset: const Offset(0,
                                                      2), // controls shadow position
                                                ),
                                              ],
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.asset(
                                                  'assets/cover_art_images/notahomewithoutyou.jpg'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5.0),
                                    Text(
                                        MediaQuery.of(context).size.width < 549
                                            ? 'not a home\nwithout you'
                                            : 'not a home without you',
                                        style: const TextStyle(
                                          fontFamily: 'Thonburi',
                                          fontSize: 14,
                                          color: AppColors.bareulohBlack,
                                        ),
                                        textAlign: TextAlign.center)
                                  ],
                                ),
                                SizedBox(
                                  width: ((((MediaQuery.of(context).size.width *
                                                  0.7) *
                                              1.1)
                                          .clamp(5, 600)) *
                                      .14),
                                ),
                                Column(
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () async {
                                          context.go('/carelesswhisper');
                                        },
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        child: SizedBox(
                                          height: (((MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.7) *
                                                      1.1)
                                                  .clamp(5, 600)) *
                                              .38,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  spreadRadius: 2,
                                                  blurRadius: 4,
                                                  offset: const Offset(0,
                                                      2), // controls shadow position
                                                ),
                                              ],
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.asset(
                                                  'assets/careless_whisper_cover_art.png'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5.0),
                                    Text(
                                      MediaQuery.of(context).size.width < 549
                                          ? 'Careless Whisper\n'
                                          : 'Careless Whisper',
                                      style: const TextStyle(
                                        fontFamily: 'Thonburi',
                                        fontSize: 15,
                                        color: AppColors.bareulohBlack,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 60.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                        child: SizedBox(
                                          height: (((MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.7) *
                                                      1.1)
                                                  .clamp(5, 600)) *
                                              .38,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  spreadRadius: 2,
                                                  blurRadius: 4,
                                                  offset: const Offset(0,
                                                      2), // controls shadow position
                                                ),
                                              ],
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
                                    ),
                                    const SizedBox(height: 5.0),
                                    const Text(
                                      'Patient',
                                      style: TextStyle(
                                        fontFamily: 'Thonburi',
                                        fontSize: 15,
                                        color: AppColors.bareulohBlack,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: ((((MediaQuery.of(context).size.width *
                                                  0.7) *
                                              1.1)
                                          .clamp(5, 600)) *
                                      .14),
                                ),
                                Column(
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () async {
                                          context.go('/bloominglate');
                                        },
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        child: SizedBox(
                                          height: (((MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.7) *
                                                      1.1)
                                                  .clamp(5, 600)) *
                                              .38,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  spreadRadius: 2,
                                                  blurRadius: 4,
                                                  offset: const Offset(0,
                                                      2), // controls shadow position
                                                ),
                                              ],
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.asset(
                                                  'assets/bloomingLateCoverArt.jpeg'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5.0),
                                    const Text(
                                      'Blooming Late',
                                      style: TextStyle(
                                        fontFamily: 'Thonburi',
                                        fontSize: 15,
                                        color: AppColors.bareulohBlack,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 50.0),
                            const SizedBox(height: 110.0),
                            const nonMainPageFooter(title: 'footer'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
