//import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'dart:math';
import 'dart:async';
import 'dart:ui';

import './artists.dart';

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
            padding: const EdgeInsets.only(left: 35.0, top: 20.0, right: 35.0),
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      Uri _url = Uri.parse('https://www.bareulohsounds.com');
                      if (!(await launchUrl(_url))) {
                        throw 'Could not launch $_url';
                      }
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
                      child: Image.asset('us1_5xpurple.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /*
          const Center(
            child: Text("Hello background"),
          ),
          */
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
                    width: MediaQuery.of(context).size.height * (0.3),
                    height: MediaQuery.of(context).size.height * (0.3),
                    // made collage using photojoiner.com
                    // then fisheye effect via https://www3.lunapic.com/editor/?action=fisheye
                    child: Image.asset('assets/rotationCenterCollage2.png'),
                  ),
                ),
              ),
            ),
          ),
          /*
          // bottom two logos
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 35.0, top: 20.0, right: 35.0, bottom: 20.0),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        Uri _url =
                            Uri.parse('https://wuzyatbareuloh.github.io/');
                        if (!(await launchUrl(_url))) {
                          throw 'Could not launch $_url';
                        }
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
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        Uri _url =
                            Uri.parse('https://wuzyatbareuloh.github.io/');
                        if (!(await launchUrl(_url))) {
                          throw 'Could not launch $_url';
                        }
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      child: SizedBox(
                        height: ((MediaQuery.of(context).size.width * (0.2))
                                .clamp(170.0, 270.0)) *
                            29 /
                            406,
                        child: Image.asset('us1_5xpurple.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          */
        ],
      ),
    );
  }
}
