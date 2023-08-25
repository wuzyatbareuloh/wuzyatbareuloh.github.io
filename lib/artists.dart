//import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'dart:math' as math;
import 'dart:async';
import 'dart:ui';

//import 'dart:ui' as ui;

class ArtistsPage extends StatefulWidget {
  const ArtistsPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<ArtistsPage> createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  //for static effect
  late Timer _timer;
  late AssetImage _staticImage = const AssetImage('assets/static1.png');
  final List<AssetImage> _staticImages = [
    const AssetImage('assets/static1.png'),
    const AssetImage('assets/static2.jpeg'),
    const AssetImage('assets/static3.png'),
    const AssetImage('assets/static4.png'),
    const AssetImage('assets/static5.png'),
    const AssetImage('assets/static6.png'),
  ];

  late bool isHovering = false;
  late bool isHovering2 = false;

  @override
  void initState() {
    // for the rotating circle
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 204))
          ..repeat();

    _timer = Timer.periodic(const Duration(milliseconds: 313), (timer) {
      setState(() {
        _staticImage =
            _staticImages[math.Random().nextInt(_staticImages.length)];
      });
    });
  }

  @override
  void dispose() {
    // for the rotating circle
    _controller.dispose();

    _timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Material(
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
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 20.0, right: 30.0),
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      Navigator.of(context).pushNamed('/'); // push named route
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    child: SizedBox(
                      width: (MediaQuery.of(context).size.width * (0.22))
                          .clamp(170.0, 270.0),
                      child: Image.asset('assets/logo.png'),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      Navigator.of(context)
                          .pushNamed('/artists'); // push named route
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    child: SizedBox(
                      height: ((MediaQuery.of(context).size.width * (0.2))
                              .clamp(170.0, 270.0)) *
                          29 /
                          406,
                      child: Opacity(
                        opacity: 0.0,
                        child: Image.asset('we1_5xpurple.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MouseRegion(
                    onHover: (event) {
                      setState(() {
                        isHovering = true;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        isHovering = false;
                      });
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () async {
                          Navigator.of(context).pushNamed('/wuzy');
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50.0,
                              child: Image.asset('wuzy.png'),
                            ),
                            const SizedBox(width: 20.0),
                            if (isHovering)
                              Transform.scale(
                                scale: 1.0,
                                origin: const Offset(0, 0),
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..rotateY(math.pi),
                                  alignment: Alignment.bottomCenter,
                                  child: const FractionalTranslation(
                                    translation: Offset(0, .15),
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60.0),
                  MouseRegion(
                    onHover: (event) {
                      setState(() {
                        isHovering2 = true;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        isHovering2 = false;
                      });
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () async {
                          Navigator.of(context).pushNamed('/cloudsinseoul');
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50.0,
                              child: Image.asset('cloudsinseoul.png'),
                            ),
                            const SizedBox(width: 20.0),
                            if (isHovering2)
                              Transform.scale(
                                scale: 1.0,
                                origin: const Offset(0, 0),
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..rotateY(math.pi),
                                  alignment: Alignment.bottomCenter,
                                  child: const FractionalTranslation(
                                    translation: Offset(0, .15),
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //const nonMainPageFooter(title: 'footer'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
