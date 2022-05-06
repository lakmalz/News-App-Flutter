import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage({required this.secureStorage});
  final FlutterSecureStorage secureStorage;

  Future<void> secureWrite(String key, String? value) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<String?> secureRead(String key) async {
    final value = await secureStorage.read(key: key);
    return value;
  }
  
  clearSecureStorage() async {
    await secureStorage.deleteAll();
  }
}
