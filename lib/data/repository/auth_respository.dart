import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:news_app/data/local/dao/user_dao.dart';
import 'package:news_app/data/local/entity/user.dart';
import 'package:news_app/data/preferences/secure_storage.dart';
import 'package:news_app/utils/constant.dart';
import 'package:news_app/utils/styles/resources.dart';

import '../../utils/failure.dart';

class AuthRepository {
  final UserDao userDao = Get.find();
  final SecureStorage secureStorage = Get.find();

  // Check user is valid with email and password
  // return User object if user is valid
  // returnn a Failure object with error message if user not registered
  Future<Either<Failure, User?>> userAuthentication(
      String email, String password) async {
    try {
      final user = await userDao.findUserByEmail(email);
      if (user?.email == email && user?.password == password) {
        saveLoggedInUserEmail(email);
        return Right(user);
      }
      return Left(Failure.init(
          title: Resources.error,
          message: Resources.errMsgIncorrectUserNameOrPassword));
    } catch (e) {
      return Left(Failure.init(error: e));
    }
  }

  // The user's email save to the secure storage
  saveLoggedInUserEmail(String email) async {
    await secureStorage.secureWrite(prefKeyEmail, email);
  }

  // Check the user alreadt loggedin
  isUserLoggedIn() async {
    final email = await secureStorage.secureRead(prefKeyEmail);
    return email != null;
  }

  Future<void> userRegistration(String email, String name, String password) async {
    await userDao.insertPerson(User(
        email: email, name: name, password: password));

    final user = await userDao.findUserByEmail(email);
    Get.log(user?.email??'');
  }

  // Perform user logout
  Future<void> userLogout() async {
    await secureStorage.clearSecureStorage();
  }

}
