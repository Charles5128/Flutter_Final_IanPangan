import 'package:flutter/material.dart';
import 'models/event_model.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/details_page.dart';
import 'pages/edit_event_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/details': (context) => DetailsPage(),
        '/edit': (context) => EditEventPage(
          event: ModalRoute.of(context)?.settings.arguments as Event,
        ),
      },
    );
  }
}
