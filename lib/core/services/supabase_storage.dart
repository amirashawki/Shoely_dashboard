import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:shoely_dashboard/core/services/storage_services.dart';
import 'package:shoely_dashboard/core/utils/backend_endpoint.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageServices implements StorageServices {
  static late Supabase _supabase;
  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: 'https://rnpwqrcehwjfwteflzar.supabase.co',
      anonKey: 'sb_publishable_KbMfu2SQSn8_C2yxarkf-w_afTlH-PF',
    );
  }

  static createBuckets(String bucketName) async {
    var buckets = await _supabase.client.storage.listBuckets();
    bool isbucketExist = false;
    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        isbucketExist = true;
        break;
      }
    }
    if (!isbucketExist) await _supabase.client.storage.createBucket(bucketName);
  }

  @override
  Future<String> uploadImage(File file, String paath) async {
    String fileName = p.basename(file.path);
    String extensionName = p.extension(file.path);
    var result = await _supabase.client.storage
        .from(BackendEndpoint.bucketName)
        .upload('$paath$fileName.$extensionName', file);
    final String publicUrl = _supabase.client.storage
        .from('BackendEndpoint.bucketName')
        .getPublicUrl('$paath$fileName');
    print('image is $publicUrl');
    print('image is $result');

    return result;
  }
}
