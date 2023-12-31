import 'package:flutter/material.dart';
import './homepage.dart';

import 'pages/artists.dart';

import 'pages/wuzy.dart';
import 'pages/cloudsinseoul.dart';
import 'pages/patientpage.dart';
import 'pages/bloominglatepage.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
  setUrlStrategy(PathUrlStrategy());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage(
            title: 'Bareulohsounds. Here, is where you belong.');
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'artists',
          builder: (BuildContext context, GoRouterState state) {
            return const ArtistsPage(title: 'artists');
          },
        ),
        GoRoute(
          path: 'wuzy',
          builder: (BuildContext context, GoRouterState state) {
            return const WuzyPage(title: 'wuzy');
          },
        ),
        GoRoute(
          path: 'cloudsinseoul',
          builder: (BuildContext context, GoRouterState state) {
            return const CloudsInSeoulPage(title: 'cloudsinseoul');
          },
        ),
        GoRoute(
          path: 'patient',
          builder: (BuildContext context, GoRouterState state) {
            return const PatientPage(title: 'patient');
          },
        ),
        GoRoute(
          path: 'bloominglate',
          builder: (BuildContext context, GoRouterState state) {
            return const BloomingLatePage(title: 'bloominglate');
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      builder: (context, router) {
        return Container(
          color: const Color.fromRGBO(
              26, 26, 255, 1.0), // Set the background color
          child: router, // Your router widget
        );
      },
    );
  }
}
