import 'package:flutter/material.dart';
import '../models/event_model.dart';
import '../services/event_service.dart';
import 'edit_event_page.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Event>> _events;

  @override
  void initState() {
    super.initState();
    _events = EventService().fetchEvents();
  }

  // Delete an event by index
  void deleteEvent(int index) {
    setState(() {
      _events = Future.value(_events as List<Event>..removeAt(index));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: FutureBuilder<List<Event>>(
        future: _events,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No events found"));
          } else {
            final events = snapshot.data!;
            return ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(events[index].imagePath),
                  title: Text(events[index].name),
                  subtitle: Text(events[index].description),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/edit',
                            arguments: events[index],
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          deleteEvent(index);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/details',
                            arguments: events[index],
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
