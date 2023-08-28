import 'package:flutter/material.dart';
import './homepage.dart';

import './artists.dart';

import './wuzy.dart';
import './cloudsinseoul.dart';
import './patientpage.dart';
import './bloominglatepage.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

//import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';

void main() {
  runApp(const MyApp());
  setUrlStrategy(PathUrlStrategy());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
  }
}
