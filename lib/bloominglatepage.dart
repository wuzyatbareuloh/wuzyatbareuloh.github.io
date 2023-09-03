//import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'dart:math';
import 'dart:async';
import 'dart:ui';

import 'package:webview_flutter/webview_flutter.dart';

import './nonMainPageFooter.dart';

import 'package:go_router/go_router.dart';

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
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Material(
              //color: Colors.transparent,

              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: darkenedImage.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            //container added for static effect

            Container(
              color: Colors.transparent,
              child: Opacity(
                opacity: 0.02,
                child: Image(
                  image: _staticImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.topLeft,
                ),
              ),
            ),

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
                        const SizedBox(height: 60.0),

                        //evankim
                        const SizedBox(height: 10.0),
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
                                  (((MediaQuery.of(context).size.width * 0.7) *
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
                        const Text(
                          'Blooming Late',
                          style: TextStyle(
                            fontFamily: 'Thonburi-Bold',
                            fontSize: 25,
                            color: Color(0xffFFFFFF),
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30.0),
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
                              width:
                                  (((MediaQuery.of(context).size.width * 0.7) *
                                          1.0)
                                      .clamp(5, 240)),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      const Color(0xffFFFFFF).withOpacity(0.8),
                                ),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Image.asset('assets/spotify.png',
                                          height: 23),
                                    ),
                                  ),
                                  const SizedBox(width: 40.0),
                                  const Text(
                                    'Spotify',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xffFFFFFF),
                                    ),
                                  ),
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
                              width:
                                  (((MediaQuery.of(context).size.width * 0.7) *
                                          1.0)
                                      .clamp(5, 240)),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      const Color(0xffFFFFFF).withOpacity(0.8),
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
                                  const SizedBox(width: 40.0),
                                  const Text(
                                    'Apple Music',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xffFFFFFF),
                                    ),
                                  ),
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
                              width:
                                  (((MediaQuery.of(context).size.width * 0.7) *
                                          1.0)
                                      .clamp(5, 240)),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      const Color(0xffFFFFFF).withOpacity(0.8),
                                ),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Image.asset('assets/youtube.png',
                                          height: 23),
                                    ),
                                  ),
                                  const SizedBox(width: 40.0),
                                  const Text(
                                    'YouTube Music',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xffFFFFFF),
                                    ),
                                  ),
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
                              width:
                                  (((MediaQuery.of(context).size.width * 0.7) *
                                          1.0)
                                      .clamp(5, 240)),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      const Color(0xffFFFFFF).withOpacity(0.8),
                                ),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Image.asset('assets/youtube.png',
                                          height: 23),
                                    ),
                                  ),
                                  const SizedBox(width: 40.0),
                                  const Text(
                                    'Official Audio',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xffFFFFFF),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15.0),

                        const SizedBox(height: 30.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[500]!.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(
                                10), // Adjust the radius for the desired roundness
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[500]!.withOpacity(0.1),
                                blurRadius: 5,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                10), // Match the borderRadius of the container
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                  sigmaX: 2,
                                  sigmaY:
                                      2), // Adjust the blur values as needed
                              child: Container(
                                padding: const EdgeInsets.all(18.0),
                                child: SizedBox(
                                  width: (((MediaQuery.of(context).size.width *
                                              0.7) *
                                          1.1)
                                      .clamp(5, 600)),
                                  child: AnimatedOpacity(
                                    opacity: _opacity,
                                    duration: const Duration(milliseconds: 500),
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
    );
  }
}
