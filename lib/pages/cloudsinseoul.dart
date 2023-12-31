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

import 'package:flutter/services.dart';

//import 'dart:ui' as ui;

class CloudsInSeoulPage extends StatefulWidget {
  const CloudsInSeoulPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<CloudsInSeoulPage> createState() => _CloudsInSeoulPageState();
}

class _CloudsInSeoulPageState extends State<CloudsInSeoulPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  //for static effect
  late Timer _timer;
  late AssetImage _staticImage = const AssetImage('assets/static3.png');
  final List<AssetImage> _staticImages = [
    const AssetImage('assets/static2.jpeg'),
    const AssetImage('assets/static3.png'),
    const AssetImage('assets/static4.png'),
    const AssetImage('assets/static5.png'),
    const AssetImage('assets/static6.png'),
  ];

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

  String whoIsCloudsInSeoul = '';

  Future<void> _loadStrings() async {
    whoIsCloudsInSeoul =
        await rootBundle.loadString('assets/content/cloudsInSeoulPage.txt');
  }

  @override
  void initState() {
    // for the rotating circle
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 204))
          ..repeat();

    _timer = Timer.periodic(const Duration(milliseconds: 313), (timer) {
      setState(() {
        _staticImage = _staticImages[Random().nextInt(_staticImages.length)];
      });
    });

    _scrollController.addListener(() {
      setState(() {
        _opacity = _scrollController.offset > 100.0 ? 1.0 : 0.0;
      });
    });

    isButtonClicked = false;
    _loadStrings();
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
    return Scaffold(
      backgroundColor: AppColors.cloudsInSeoulBackground,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 35.0, top: 20.0, right: 35.0),
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
                            height:
                                (((MediaQuery.of(context).size.width * (0.2))
                                        .clamp(170.0, 270.0)) *
                                    70 /
                                    394),
                            child: Image.asset('assets/logoSymbol.png'),
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
                            width: ((MediaQuery.of(context).size.width * (0.7))
                                .clamp(10, 220)),
                            child:
                                Image.asset('assets/cloudsInSeoulTempPic.png'),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Animate(
                          effects: const [
                            FadeEffect(duration: Duration(seconds: 4)),
                          ],
                          child: const Text(
                            'Clouds in Seoul',
                            style: TextStyle(
                              fontFamily: 'Thonburi-Bold',
                              fontSize: 29,
                              color: Color(0xffFFFFFF),
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
                                        'https://open.spotify.com/artist/1NvogHULhzbI6YCvzIiKEl?si=4UXBUNtFTpWBi60dqNHj9g');
                                    if (!(await launchUrl(_url))) {
                                      throw 'Could not launch $_url';
                                    }
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  child: SizedBox(
                                    height: 23,
                                    child: Image.asset('assets/spotify.png'),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14.0),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () async {
                                    Uri _url = Uri.parse(
                                        'https://music.apple.com/us/artist/clouds-in-seoul/1702506631');
                                    if (!(await launchUrl(_url))) {
                                      throw 'Could not launch $_url';
                                    }
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  child: SizedBox(
                                    height: 23,
                                    child: Image.asset('assets/applemusic.png'),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14.0),
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
                                  child: SizedBox(
                                    height: 23,
                                    child: Image.asset('assets/instagram.png'),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14.0),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () async {
                                    Uri _url = Uri.parse(
                                        'https://www.youtube.com/channel/UC7hjh0KxAkRKYJIIz1_QsOg');
                                    if (!(await launchUrl(_url))) {
                                      throw 'Could not launch $_url';
                                    }
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  child: SizedBox(
                                    height: 23,
                                    child: Image.asset('assets/youtube.png'),
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
                                  spreadRadius: 0, // Reduce or remove spread
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
                                        0), // Adjust the blur values as needed
                                child: Container(
                                  padding: const EdgeInsets.all(18.0),
                                  color: Colors.transparent,
                                  child: SizedBox(
                                    width:
                                        (((MediaQuery.of(context).size.width *
                                                    0.7) *
                                                1.1)
                                            .clamp(5, 600)),
                                    child: AnimatedOpacity(
                                      opacity: _opacity,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      child: const Text(
                                        "Clouds in Seoul is a singer-songwriter and cofounder of Bareulohsounds.\n\n\nOther than a few years spent in the UK and on a US military base, he has lived in Seoul his whole life and wants to make music based on the observations he makes. He prefers an approach with as few instruments as possible, and hopes his music provides a personal listening experience.\n\n\nHe's helped co-produce a majority of Wuzy's releases, and is currently working on his debut album \"Warmth\".\n\n\nHis biggest musical influences are the Beatles, Trent Reznor, Rachael Yamagata, and the Lumineers.",
                                        style: TextStyle(
                                          fontFamily: 'Thonburi',
                                          fontSize: 15,
                                          color: Color(0xffFFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 180.0),
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
    );
  }
}
