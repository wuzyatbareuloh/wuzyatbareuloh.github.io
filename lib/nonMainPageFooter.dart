//import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'dart:math' as math;
import 'dart:async';
import 'dart:ui';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 1.5, // Adjust the height to make the line thicker
            color:
                const Color.fromRGBO(126, 126, 245, 1.0), // Color of the line
            child: const Divider(
              color: Colors
                  .transparent, // Set the color of the Divider to transparent
              height: 0,
            ),
          ),
          Container(
            color: const Color.fromRGBO(126, 126, 245, 1.0),
            child: Column(
              children: [
                const SizedBox(height: 30.0),
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
                              height: 21,
                              child: Image.asset('assets/instagram.png'),
                            ),
                            Text(
                              ' @bareulohsounds',
                              style: TextStyle(
                                fontFamily: 'Thonburi',
                                fontSize: 14,
                                color: const Color(0xffFFFFFF).withOpacity(0.8),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25.0),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 15.0),
                    child: Text(
                      "© 20xx 🎨 Jadujam, Clouds in Seoul & 👨‍💻 Wuzy"
                          .replaceAll("20xx", DateTime.now().year.toString()),
                      style: TextStyle(
                        fontFamily: 'Thonburi',
                        fontSize: 11,
                        color: const Color(0xffFFFFFF).withOpacity(0.6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
