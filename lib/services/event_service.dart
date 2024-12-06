import '../models/event_model.dart';

class EventService {
  Future<List<Event>> fetchEvents() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay

    return [
      Event(
        name: "1st Eve",
        description: "Christmas Celebration",
        imagePath: "assets/images/event1.jpeg",
      ),
      Event(
        name: "2nd Eve",
        description: "New Year Party",
        imagePath: "assets/images/event2.jpeg",
      ),
    ];
  }
}
