import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dishboard_fruits_app/core/services/database_service.dart';

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
      var docSnapshot = await firestore.collection(path).doc(docId).get();
      return docSnapshot.data();
    }

    if (query != null && query.containsKey('orderBy')) {
      String orderByField = query['orderBy'];
      bool descending = query['descending'] ?? false;
      int? limit = query['limit'];

      var collectionRef = firestore.collection(path);
      var queryRef = collectionRef.orderBy(
        orderByField,
        descending: descending,
      );

      if (limit != null && limit > 0) {
        queryRef = queryRef.limit(limit);
      }

      var querySnapshot = await queryRef.get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    }

    var data = await firestore.collection(path).get();
    return data.docs.map((doc) => doc.data()).toList();
  }

  @override
  Stream<List<Map<String, dynamic>>> streamData({
    required String path,
    Map<String, dynamic>? query,
  }) async* {
    Query queryRef = firestore.collection(path);

    if (query != null) {
      if (query.containsKey('orderBy')) {
        queryRef = queryRef.orderBy(
          query['orderBy'],
          descending: query['descending'] ?? false,
        );
      }

      if (query.containsKey('limit')) {
        final limit = query['limit'];
        if (limit != null && limit > 0) {
          queryRef = queryRef.limit(limit);
        }
      }
    }

    await for (var snapshot in queryRef.snapshots()) {
      yield snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    }
  }

  @override
  Future<void> updataData({
    required String path,
    required Map<String, dynamic> data,
    String? id,
  }) async {
    await firestore.collection(path).doc(id).update(data);
  }
}
