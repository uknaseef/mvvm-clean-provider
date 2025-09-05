import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'local_base_services.dart';

class SembastServices extends LocalBaseServices {
  String dbPath = 'database.db';
  late Database db;

  @override
  Future<void> deleteUserData() async {
    var store = intMapStoreFactory.store('user_details');
    await store.delete(db);
  }

  @override
  Future<void> initialize() async {
    final appDir = await getApplicationCacheDirectory();
    db = await databaseFactoryIo.openDatabase('${appDir.path}/$dbPath');
  }
}
