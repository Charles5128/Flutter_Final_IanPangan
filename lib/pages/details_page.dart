import 'package:flutter/material.dart';
import '../models/event_model.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Event event = ModalRoute.of(context)!.settings.arguments as Event;

    return Scaffold(
      appBar: AppBar(title: Text(event.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(event.imagePath, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(event.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(event.description),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text("RSVP Now"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text("Go to Home Page"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Text("Go to Profile Page"),
            ),
          ],
        ),
      ),
    );
  }
}
