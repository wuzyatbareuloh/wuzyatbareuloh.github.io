import 'package:flutter/material.dart';
import './homepage.dart';

import 'pages/artists.dart';

import 'pages/wuzy.dart';
import 'pages/cloudsinseoul.dart';
import 'pages/patientpage.dart';
import 'pages/bloominglatepage.dart';
import 'pages/careless_whisper_page.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:go_router/go_router.dart';

import 'universalComponents/fade_transition_page.dart';

void main() {
  runApp(const MyApp());
  setUrlStrategy(PathUrlStrategy());
}
/*
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
*/

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return FadeTransitionPage(
          child: const MyHomePage(
              title: 'Bareulohsounds. Here, is where you belong.'),
          key: state.pageKey, // Ensure a unique key for each page
        );
      },
    ),
    GoRoute(
      path: '/artists',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return FadeTransitionPage(
          child: const ArtistsPage(title: 'Artists'),
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: '/wuzy',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return FadeTransitionPage(
          child: const WuzyPage(title: 'Wuzy'),
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: '/cloudsinseoul',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return FadeTransitionPage(
          child: const CloudsInSeoulPage(title: 'Clouds in Seoul'),
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: '/patient',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return FadeTransitionPage(
          child: const PatientPage(title: 'Patient'),
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: '/bloominglate',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return FadeTransitionPage(
          child: const BloomingLatePage(title: 'Blooming Late'),
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: '/carelesswhisper',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return FadeTransitionPage(
          child: const CarelessWhisperPage(title: 'Careless Whisper'),
          key: state.pageKey,
        );
      },
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
