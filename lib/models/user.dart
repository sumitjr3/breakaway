import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String username;
  String email;
  String password;
  String name;
  String gender;
  int age;
  String city;
  List<String> interests;
  List<String> memberOf;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.name,
    required this.gender,
    required this.age,
    required this.city,
    required this.interests,
    required this.memberOf,
  });

  factory User.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return User(
      id: doc.id,
      username: data['username'],
      email: data['email'],
      password: data['password'],
      name: data['name'],
      gender: data['gender'],
      age: data['age'],
      city: data['city'],
      interests: List<String>.from(data['interests']),
      memberOf: List<String>.from(data['member_of']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'name': name,
      'gender': gender,
      'age': age,
      'city': city,
      'interests': interests,
      'member_of': memberOf,
    };
  }
}
