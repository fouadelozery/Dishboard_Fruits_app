import 'package:cloud_firestore/cloud_firestore.dart';
import 'database_service.dart';

class FireStoreServices implements DatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? id,
  }) async {
    if (id != null) {
      await firestore.collection(path).doc(id).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? docId,
    Map<String, dynamic>? query,
  }) async {
    if (docId != null) {
      final docSnapshot = await firestore.collection(path).doc(docId).get();
      return docSnapshot.data();
    }

    final collectionRef = firestore.collection(path);
    final snapshot = await collectionRef.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Stream<List<Map<String, dynamic>>> streamData({
    required String path,
    Map<String, dynamic>? query,
  }) async* {
    Query queryRef = firestore.collection(path);

    await for (var snapshot in queryRef.snapshots()) {
      yield snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    }
  }

  @override
  @override
  Future<void> updataData({
    required String path,
    required Map<String, dynamic> data,
    String? id,
  }) async {
    if (id == null) throw Exception("Document ID is required");

    final docRef = firestore.collection(path).doc(id);

    // Creates or updates safely
    await docRef.set(data, SetOptions(merge: true));
  }

  @override
  Future<bool> checkDocumentExists({
    required String path,
    required String id,
  }) async {
    final doc = await firestore.collection(path).doc(id).get();
    return doc.exists;
  }
}
