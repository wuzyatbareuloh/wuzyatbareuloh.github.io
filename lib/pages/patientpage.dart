//import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'dart:math';
import 'dart:async';
import 'dart:ui';

import 'package:webview_flutter/webview_flutter.dart';

import '../universalComponents/nonMainPageFooter.dart';

import 'package:go_router/go_router.dart';

//import 'package:audioplayers/audioplayers.dart';

import '../universalComponents/colors.dart';

import 'package:flutter/services.dart';

import 'dart:html' as html;

//import 'dart:ui' as ui;

class PatientPage extends StatefulWidget {
  const PatientPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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

  //final audioPlayer = AudioPlayer();
  //bool isPlaying = false;
  /*
  Future setAudio() async {
    // Repeat song when completed
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);

    // Load audio
    final player = AudioCache(prefix: 'assets/');
    final url = await player.load('wuzyPatient.mp3');
    audioPlayer.setUrl(url.path, isLocal: true);
  }
  */

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
    });

    // Listen to states: playing, paused, stopped
    /*
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });

    setAudio();
    */
  }

  @override
  void dispose() {
    // for the rotating circle
    _controller.dispose();

    _scrollController.dispose();

    //audioPlayer.stop();
    //audioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double startHorizontalDrag = 0.0;
    return Title(
        title: "Wuzy - Patient",
        color: AppColors.patientBackground,
        child: GestureDetector(
            onHorizontalDragStart: (DragStartDetails details) {
              // Record the position where the drag started.
              startHorizontalDrag = details.globalPosition.dx;
            },
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              // Calculate the distance dragged.
              double distance = details.globalPosition.dx - startHorizontalDrag;

              // Check if dragged distance is more than a set threshold, e.g., 30 pixels.
              if (distance > 30) {
                // User swiped Left
                Navigator.of(context).pop(); // Go back to previous screen
              }
            },
            child: Scaffold(
              backgroundColor: AppColors.patientBackground,
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
                                    height:
                                        (((MediaQuery.of(context).size.width *
                                                    (0.2))
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
                                const SizedBox(height: 55.0),

                                //evankim

                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () async {
                                      //Navigator.of(context).pushNamed('/patient');
                                    },
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    child: Container(
                                      height:
                                          (((MediaQuery.of(context).size.width *
                                                      0.7) *
                                                  1.1)
                                              .clamp(5, 240)),
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
                                  'Patient',
                                  style: TextStyle(
                                    fontFamily: 'Thonburi-Bold',
                                    fontSize: 25,
                                    color: Color(0xffFFFFFF),
                                    //fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 12.0),
                                /*
                                IconButton(
                                  icon: Icon(
                                    isPlaying ? Icons.pause : Icons.play_arrow,
                                  ),
                                  iconSize: 35,
                                  color:
                                      const Color.fromRGBO(126, 126, 245, 0.9),
                                  onPressed: () async {
                                    if (isPlaying) {
                                      await audioPlayer.pause();
                                    } else {
                                      await audioPlayer.resume();
                                    }
                                  },
                                ),
                                */

                                const SizedBox(height: 25.0),

                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () async {
                                      Uri _url = Uri.parse(
                                          'https://open.spotify.com/track/73zqNG7tiCBa7wzdN9QKAv');
                                      if (!(await launchUrl(_url))) {
                                        throw 'Could not launch $_url';
                                      }
                                    },
                                    child: Container(
                                      height: 43,
                                      width:
                                          (((MediaQuery.of(context).size.width *
                                                      0.7) *
                                                  1.0)
                                              .clamp(5, 240)),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xffFFFFFF)
                                              .withOpacity(0.8),
                                        ),
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: Image.asset(
                                                  'assets/spotify.png',
                                                  height: 23),
                                            ),
                                          ),
                                          const SizedBox(width: 10.0),
                                          const Expanded(
                                            child: Text(
                                              'Spotify',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xffFFFFFF),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          const SizedBox(width: 30.0),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 15.0),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () async {
                                      Uri _url = Uri.parse(
                                          'https://music.apple.com/us/album/patient-single/1674382983');
                                      if (!(await launchUrl(_url))) {
                                        throw 'Could not launch $_url';
                                      }
                                    },
                                    child: Container(
                                      height: 43,
                                      width:
                                          (((MediaQuery.of(context).size.width *
                                                      0.7) *
                                                  1.0)
                                              .clamp(5, 240)),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xffFFFFFF)
                                              .withOpacity(0.8),
                                        ),
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: Image.asset(
                                                  'assets/applemusic.png',
                                                  height: 23),
                                            ),
                                          ),
                                          const SizedBox(width: 10.0),
                                          const Expanded(
                                            child: Text(
                                              'Apple Music',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xffFFFFFF),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          const SizedBox(width: 30.0),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 15.0),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () async {
                                      Uri _url = Uri.parse(
                                          'https://music.youtube.com/watch?v=fj7c5xE90KQ&feature=shared');
                                      if (!(await launchUrl(_url))) {
                                        throw 'Could not launch $_url';
                                      }
                                    },
                                    child: Container(
                                      height: 43,
                                      width:
                                          (((MediaQuery.of(context).size.width *
                                                      0.7) *
                                                  1.0)
                                              .clamp(5, 240)),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xffFFFFFF)
                                              .withOpacity(0.8),
                                        ),
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: Image.asset(
                                                  'assets/youtube.png',
                                                  height: 23),
                                            ),
                                          ),
                                          const SizedBox(width: 10.0),
                                          const Expanded(
                                            child: Text(
                                              'YouTube Music',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xffFFFFFF),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          const SizedBox(width: 30.0),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 15.0),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () async {
                                      Uri _url = Uri.parse(
                                          'https://www.youtube.com/watch?v=Ch0DdSspeyY');
                                      if (!(await launchUrl(_url))) {
                                        throw 'Could not launch $_url';
                                      }
                                    },
                                    child: Container(
                                      height: 43,
                                      width:
                                          (((MediaQuery.of(context).size.width *
                                                      0.7) *
                                                  1.0)
                                              .clamp(5, 240)),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xffFFFFFF)
                                              .withOpacity(0.8),
                                        ),
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: Image.asset(
                                                  'assets/youtube.png',
                                                  height: 23),
                                            ),
                                          ),
                                          const SizedBox(width: 10.0),
                                          const Expanded(
                                            child: Text(
                                              'Official Audio',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xffFFFFFF),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          const SizedBox(width: 30.0),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 15.0),

                                const SizedBox(height: 30.0),
                                Container(
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
                                          sigmaX: 0, sigmaY: 0),
                                      child: Container(
                                        padding: const EdgeInsets.all(18.0),
                                        color: Colors.transparent,
                                        child: SizedBox(
                                          width: (((MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.7) *
                                                  1.1)
                                              .clamp(5, 600)),
                                          child: AnimatedOpacity(
                                            opacity: _opacity,
                                            duration: const Duration(
                                                milliseconds: 500),
                                            child: const Text(
                                              "Roman holiday, I've been listening\nHum it all day by myself\nBefore it posts up for everybody\nI been thinking about sleep forever now\nStuck in this room, I miss them days\nMade for two, (nope) it was made for one\nI swear I was turning fine\nHate everything candlelight run away\n\nI ain't going to die\nI ain't going to fly\nI ain't going to sleep tonight\nI feel nothing\nI feel drowning\nI feel inside out\nI ain't going to try\nI ain't going to pry\nI ain't going to leave tonight\nI feel nothing\nI feel drowning\nI feel inside out\n\nDoctor told me be patient\nLet nobody play with your pace\nSlay day lay day some day\nYou'll be up same time everyday\nClouds in Seoul showed me up warm skies\nJadujam paved me up spayed roads\nFelt me sliming all night\nDreaming up same scene every night\n\n원하지 않았던 선물\n버리진 못하겠고\n이런 유통기한 있는\n팔긴 어렵겠고\n그냥 냅둬버려?\n아니면 가둬버려?\n한때는 걍 늘어놨었는데\n다 부질없고\n차피 난 없는 거고\n누군가의 비운에 맞겨\n\nI ain't going to die\nI ain't going to fly\nI ain't going to sleep tonight\nI feel nothing\nI feel drowning\nI feel inside out\nI ain't going to try\nI ain't going to pry\nI ain't going to leave tonight\nI feel nothing\nI feel drowning\nI feel inside out\n\nDoctor told me be patient\nLet nobody play with your pace\nSlay day lay day some day\nYou'll be up same time everyday\nClouds in Seoul showed me up warm skies\nJadujam paved me up spayed roads\nFelt me sliming all night\nDreaming up same scene all night",
                                              textAlign: TextAlign.center,
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
                                const SizedBox(height: 50.0),

                                const SizedBox(height: 50.0),
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
            )));
  }
}
