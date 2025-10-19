

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dishboard_fruits_app/core/services/database_service.dart';

class FireStoreServices implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  @override
  get supabase => throw UnimplementedError('Supabase is not implemented in FireStoreServices.');

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String  ? id
  }) async {
    if (id != null) {
      await firestore.collection(path).doc(id).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  Future<Map<String,dynamic>> getData({
    required String path,
    required String uid,
  }) async {
    var data = await firestore.collection(path).doc(uid).get();
    return data.data() as Map<String, dynamic>;
  }
}
