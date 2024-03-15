// network/api_service.dart
import 'package:breakaway/models/group.dart';
import 'package:breakaway/service_provider/api_client.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ApiService {
  final ApiClient _apiClient = ApiClient();

  Future<void> sendMessage(String groupId, Message message) async {
    _apiClient.getGroupCollection().doc(groupId).update({
      'messages': FieldValue.arrayUnion([message.toMap()]),
    });
  }

  Stream<List<Message>> getMessages(String groupId) {
    return _apiClient.getGroupCollection().doc(groupId).snapshots().map((doc) =>
        (doc.data()?['messages'] as List<dynamic>)
            .map((message) => Message.fromMap(message))
            .toList());
  }
}
