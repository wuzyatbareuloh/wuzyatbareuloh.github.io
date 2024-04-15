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

class CarelessWhisperPage extends StatefulWidget {
  const CarelessWhisperPage({super.key, required this.title});

  final String title;

  @override
  State<CarelessWhisperPage> createState() => _CarelessWhisperPageState();
}

class _CarelessWhisperPageState extends State<CarelessWhisperPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  ScrollController _scrollController = ScrollController();
  double _opacity = 0.0;

  String carelessWhisperLyrics = '';

  Future<void> _loadStrings() async {
    final lyrics = await rootBundle
        .loadString('assets/content/careless_whisper_lyrics.txt');
    setState(() {
      carelessWhisperLyrics = lyrics;
    });
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

    _loadStrings();
  }

  @override
  void dispose() {
    // for the rotating circle
    _controller.dispose();

    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: "Wuzy - Careless Whisper",
        color: AppColors.careless_whisper_background,
        child: Scaffold(
          backgroundColor: AppColors.careless_whisper_background,
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
                                        'assets/careless_whisper_cover_art.png'),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            const Column(
                              children: [
                                Text(
                                  'Careless Whisper',
                                  style: TextStyle(
                                    fontFamily: 'Thonburi-Bold',
                                    fontSize: 25,
                                    color: Color(0xffFFFFFF),
                                    //fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12.0),

                            const SizedBox(height: 25.0),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () async {
                                  Uri _url = Uri.parse('TO UPDATE');
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
                                      'https://music.apple.com/us/album/careless-whisper-single/1735868699');
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
                                  Uri _url = Uri.parse('TO UPDATE');
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
                                      //updated 2024.03.13
                                      'https://www.youtube.com/watch?v=nMchhPjzDsM');
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
                                          'Official Lyrics Video',
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
                                        child: Text(
                                          carelessWhisperLyrics,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
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
