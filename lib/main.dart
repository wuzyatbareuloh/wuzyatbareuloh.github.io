import 'package:flutter/material.dart';
import './homepage.dart';

import './artists.dart';

import './wuzy.dart';
import './cloudsinseoul.dart';
import './patientpage.dart';
import './bloominglatepage.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
  setUrlStrategy(const PathUrlStrategy());
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
    /*
    return MaterialApp(
      title: 'Bareulohsounds.',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Bareuloh Sounds Homepage'),
        '/artists': (context) => const ArtistsPage(title: 'artists'),
        '/wuzy': (context) => const WuzyPage(title: 'wuzy'),
        '/cloudsinseoul': (context) =>
            const CloudsInSeoulPage(title: 'clouds in seoul'),
        '/patient': (context) => const PatientPage(title: 'patient'),
        '/bloominglate': (context) =>
            const BloomingLatePage(title: 'bloominglate'),
      },
    );
    */
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
