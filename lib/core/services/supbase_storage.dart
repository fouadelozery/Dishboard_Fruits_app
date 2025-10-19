import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:dishboard_fruits_app/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorage implements StorageService {
  final SupabaseClient _supabase = Supabase.instance.client;
  @override
  Future<String> uploadImage(File file, String path) async {
    try {
      final fileExt = p.extension(file.path);
      final fileName = '${DateTime.now().millisecondsSinceEpoch}$fileExt';
      final String filePath = '$path/$fileName';
      await _supabase.storage
          .from('image')
          .upload(
            filePath,
            file,
            fileOptions: const FileOptions(cacheControl: '3600'),
          );
      final String publicUrl = _supabase.storage
          .from('image')
          .getPublicUrl(filePath);
      return publicUrl;
    } on StorageException catch (e) {
      throw Exception('Upload failed: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
