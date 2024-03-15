// network/api_client.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class ApiClient {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> getGroupCollection() {
    return _firestore.collection('groups');
  }
}
