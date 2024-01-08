class Note {
  String title;
  String content;
  DateTime timestamp;

  Note({
    required this.title,
    required this.content,
    required this.timestamp,
  });

  // Convert a Note object into a Map for serialization
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  // Create a Note object from a Map (e.g., from JSON data)
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      title: json['title'],
      content: json['content'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
