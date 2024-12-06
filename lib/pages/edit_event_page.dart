import 'package:flutter/material.dart';
import '../models/event_model.dart';

class EditEventPage extends StatefulWidget {
  final Event event;

  EditEventPage({required this.event});

  @override
  _EditEventPageState createState() => _EditEventPageState();
}

class _EditEventPageState extends State<EditEventPage> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.event.name);
    _descriptionController = TextEditingController(text: widget.event.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Event")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Event Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Event Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Event updatedEvent = Event(
                  name: _nameController.text,
                  description: _descriptionController.text,
                  imagePath: widget.event.imagePath, // Keeping the same image path
                );
                Navigator.pop(context, updatedEvent); // Send back the updated event
              },
              child: Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
