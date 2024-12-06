import 'package:flutter/material.dart';
import '../models/event_model.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  EventCard({required this.event, required this.onDelete, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Image.asset(event.imagePath, width: 100, height: 100),
        title: Text(event.name),
        subtitle: Text(event.description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
