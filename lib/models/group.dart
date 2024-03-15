import 'package:cloud_firestore/cloud_firestore.dart';

class Group {
  String id;
  String interest;
  String city;
  List<Message> messages;

  Group({
    required this.id,
    required this.interest,
    required this.city,
    this.messages = const [],
  });

  factory Group.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    List<dynamic> messageData = data['messages'];
    List<Message> messages =
        messageData.map((e) => Message.fromMap(e)).toList();
    return Group(
      id: doc.id,
      interest: data['interest'],
      city: data['city'],
      messages: messages,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'interest': interest,
      'city': city,
      'messages': messages.map((message) => message.toMap()).toList(),
    };
  }
}

class Message {
  Timestamp time;
  String content;
  String sender;

  Message({
    required this.time,
    required this.content,
    required this.sender,
  });

  factory Message.fromMap(Map<String, dynamic> data) {
    return Message(
      time: data['time'],
      content: data['content'],
      sender: data['sender'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'content': content,
      'sender': sender,
    };
  }
}
