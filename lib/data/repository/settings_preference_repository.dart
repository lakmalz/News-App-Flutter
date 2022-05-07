import 'package:get/get.dart';
import 'package:news_app/data/preferences/secure_storage.dart';
import 'package:news_app/utils/constant.dart';

class UserPreferencesRepository {
  final SecureStorage secureStorage = Get.find();

  saveFilterCountry(String country) async {
    await secureStorage.secureWrite(prefKeyCountry, country);
  }

  saveFilterLanguage(String language) async {
    await secureStorage.secureWrite(prefKeyLanguage, language);
  }

  Future<String?> readFilterCountry() async {
    final country = await secureStorage.secureRead(prefKeyCountry);
    return country;
  }

  Future<String?> readFilterLanguage() async {
    final language = await secureStorage.secureRead(prefKeyLanguage);
    return language;
  }
}
