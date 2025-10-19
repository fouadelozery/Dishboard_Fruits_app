// 📄 lib/core/services/database_service.dart

import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  final SupabaseClient supabase;

  DatabaseService(this.supabase);

  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final response = await supabase.from(path).insert(data);

    if (response.error != null) {
      throw Exception(response.error!.message);
    }

  
    print(" Data added successfully to $path");
  }
}
