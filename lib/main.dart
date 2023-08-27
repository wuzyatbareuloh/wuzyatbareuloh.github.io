import 'package:flutter/material.dart';
import './homepage.dart';

import './artists.dart';

import './wuzy.dart';
import './cloudsinseoul.dart';
import './patientpage.dart';
import './bloominglatepage.dart';

//import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';

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
        primarySwatch: Colors.blue,
      ),
      //initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            if (_currentPath == '/') {
              return const MyHomePage(title: 'Bareuloh Sounds Homepage');
            } else if (_currentPath == '/artists') {
              return const ArtistsPage(title: 'artists');
            } else if (_currentPath == '/wuzy') {
              return const WuzyPage(title: 'wuzy');
            } else if (_currentPath == '/cloudsinseoul') {
              return const CloudsInSeoulPage(title: 'clouds in seoul');
            } else if (_currentPath == '/patient') {
              return const PatientPage(title: 'patient');
            } else if (_currentPath == '/bloominglate') {
              return const BloomingLatePage(title: 'bloominglate');
            }
            // You can return a default page or show an error page
            return const Text('Page not found');
          },
        );
      },
    );
  }
}
