//import 'dart:ui';

import 'package:flutter/material.dart';

import 'dart:math' as math;
import 'dart:async';

import 'package:go_router/go_router.dart';

import '../universalComponents/colors.dart';

import 'dart:html' as html;

class ArtistsPage extends StatefulWidget {
  const ArtistsPage({super.key, required this.title});

  final String title;

  @override
  State<ArtistsPage> createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage>
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
    return Title(
        title: "Bareuloh Sounds | Artists",
        color: AppColors.homepageBackgroundBlue,
        child: Scaffold(
          backgroundColor: AppColors.homepageBackgroundBlue,
          body: SafeArea(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30.0, top: 20.0, right: 30.0),
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
                            width: (MediaQuery.of(context).size.width * 0.2)
                                .clamp(170.0, 270.0),
                            child: ColorFiltered(
                              colorFilter: const ColorFilter.mode(
                                AppColors.bareulohBlack, // Desired color
                                BlendMode.srcIn, // Blend mode
                              ),
                              child: Image.asset('assets/logo.png'),
                            ),
                          ),
                        ),
                      ),
                      Material(
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
                                29 /
                                406,
                            child: Opacity(
                              opacity: 0.0,
                              child: Image.asset('artists1_5x.png'),
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
                                context.go('/wuzy');
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 40.0,
                                    child: ColorFiltered(
                                      colorFilter: ColorFilter.mode(
                                        isHovering
                                            ? AppColors.bareulohPurple
                                            : AppColors
                                                .bareulohBlack, // Change color on hover
                                        BlendMode.srcIn,
                                      ),
                                      child: Image.asset(
                                          'wuzy.png'), // Your "wuzy" text image
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
                                context.go('/cloudsinseoul');
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 40.0,
                                    child: ColorFiltered(
                                      colorFilter: ColorFilter.mode(
                                        isHovering2
                                            ? AppColors.bareulohPurple
                                            : AppColors
                                                .bareulohBlack, // Change color on hover
                                        BlendMode.srcIn,
                                      ),
                                      child: Image.asset(
                                          'cloudsinseoul.png'), // Your "wuzy" text image
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
          ),
        ));
  }
}
