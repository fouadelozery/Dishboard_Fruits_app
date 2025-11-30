abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? id,
  });

  Future<dynamic> getData({
    required String path,
    String? docId,
    Map<String, dynamic>? query,
  });
  Stream<dynamic> streamData({
    required String path,
    Map<String, dynamic>? query,
  });
}
