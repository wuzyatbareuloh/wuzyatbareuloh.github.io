//import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'dart:math';
import 'dart:async';
import 'dart:ui';

import 'package:webview_flutter/webview_flutter.dart';

import '../universalComponents/nonMainPageFooter.dart';

import 'package:go_router/go_router.dart';

import 'package:audioplayers/audioplayers.dart';

import '../universalComponents/colors.dart';

import 'package:flutter/services.dart';

import 'dart:html' as html;

//import 'dart:ui' as ui;

class BloomingLatePage extends StatefulWidget {
  const BloomingLatePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<BloomingLatePage> createState() => _BloomingLatePageState();
}

class _BloomingLatePageState extends State<BloomingLatePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  //for static effect

  ScrollController _scrollController = ScrollController();
  double _opacity = 0.0;

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;

  Future setAudio() async {
    // Repeat song when completed
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);

    // Load audio
    final player = AudioCache(prefix: 'assets/');
    final url = await player.load('wuzyBloomingLate.mp3');
    audioPlayer.setUrl(url.path, isLocal: true);
  }

  String bloomingLateLyrics = '';

  Future<void> _loadStrings() async {
    bloomingLateLyrics =
        await rootBundle.loadString('assets/content/bloomingLateLyrics.txt');
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
    });

    // Listen to states: playing, paused, stopped
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });

    setAudio();

    _loadStrings();
  }

  @override
  void dispose() {
    // for the rotating circle
    _controller.dispose();

    _scrollController.dispose();

    audioPlayer.stop();
    audioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: "Wuzy - Blooming Late (ft. Sean Park)",
        color: AppColors.bloomingLateBackground,
        child: Scaffold(
          backgroundColor: AppColors.bloomingLateBackground,
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
                                  height: (((MediaQuery.of(context).size.width *
                                              0.7) *
                                          1.1)
                                      .clamp(5, 240)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                        'assets/bloomingLateCoverArt.jpeg'),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            const Column(
                              children: [
                                Text(
                                  'Blooming Late',
                                  style: TextStyle(
                                    fontFamily: 'Thonburi-Bold',
                                    fontSize: 25,
                                    color: Color(0xffFFFFFF),
                                    //fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ' (ft. Sean Park)',
                                  style: TextStyle(
                                    fontFamily: 'Thonburi-Bold',
                                    fontSize: 15,
                                    color: Color(0xffFFFFFF),
                                    //fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12.0),
                            /*
                            IconButton(
                              icon: Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow,
                              ),
                              iconSize: 35,
                              color: const Color.fromRGBO(126, 126, 245, 0.9),
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
                                      'https://open.spotify.com/track/7C3JKgGdsnUlSRDdruJZMD?si=29b9ae2210f94b69');
                                  if (!(await launchUrl(_url))) {
                                    throw 'Could not launch $_url';
                                  }
                                },
                                child: Container(
                                  height: 43,
                                  width: (((MediaQuery.of(context).size.width *
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
                                      'https://music.apple.com/kr/album/blooming-late-feat-sean-park/1643589667?i=1643589668');
                                  if (!(await launchUrl(_url))) {
                                    throw 'Could not launch $_url';
                                  }
                                },
                                child: Container(
                                  height: 43,
                                  width: (((MediaQuery.of(context).size.width *
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
                                      'https://music.youtube.com/watch?v=FwyyU0wVYpk&feature=shared');
                                  if (!(await launchUrl(_url))) {
                                    throw 'Could not launch $_url';
                                  }
                                },
                                child: Container(
                                  height: 43,
                                  width: (((MediaQuery.of(context).size.width *
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
                                      'https://www.youtube.com/watch?v=7uXUP9P7uuk');
                                  if (!(await launchUrl(_url))) {
                                    throw 'Could not launch $_url';
                                  }
                                },
                                child: Container(
                                  height: 43,
                                  width: (((MediaQuery.of(context).size.width *
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
                                color: Colors.transparent,
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
                                  filter:
                                      ImageFilter.blur(sigmaX: 0, sigmaY: 0),
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
                                          "We blooming late\nWe'll make you pay\nIf you highlight you just gotta stay\nA different state\nCrispy like lay\nIf you want me you just gotta wait\n\n\nI swear\nI was turning fine\nRiches, always hang on tight\nYeah we rock the high wave\nCuz my Manor's got my back\nDriving time till we discharge (yeh)\n\n\nAin't nobody gon' hesitate\nTill we kick back\nSip my, no mula\nI just wanna get bread like on.t\nRing ring thru like my cage\nYou like my ways (yuh)\nNeed you out my way\n\n\nCandlelight\nRun away\nEverything\nBetween\nBareuloh\nKiana, I wonder why\nJust once\nLike a star\nLove me again\nStuck in this room, I know...\nDon't you wish it was a joke\nNow, maybe just a prank\n\n\nWe blooming late\nWe'll make you pay\nIf you highlight you just gotta stay\nA different state\nCrispy like lay\nIf you want me you just gotta (sp)\n\n\nWait a minute yeah\nHey Wuzy 우리 첫 발걸음은 시작되었고\nFame money 많을걸 원하지 않아\n그냥 소통을 바래 yeh\nYeah 너무 빨리 뜨면 재미없지\n원래 늦게 피는 꽃이 더 멋지고 오래가는 거야\n\n\nLay me down\nCall you mine\nThat's what I like\nRemember when\nDrive you\n보고 싶다\nCrush\nLocation\nHisaishi\nAri, on.t\nIsn't she lovely\n근데 그건\n비밀이야\n\n\nRollercoaster ride\nWe choose up and down\n82 high up\n상관없어\n그냥 즐겨봐 this minute\nAin't no sketch we'd fit\n\n\nWe blooming late\nWe'll make you pay\nIf you highlight you just gotta stay\nA different state\nCrispy like lay\nIf you want me you just gotta wait",
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
        ));
  }
}
