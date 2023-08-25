import 'package:flutter/material.dart';
import './homepage.dart';
import 'package:blur/blur.dart';

import './artists.dart';

import './wuzy.dart';
import './cloudsinseoul.dart';
import './patientpage.dart';
import './bloominglatepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bareulohsounds.',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
