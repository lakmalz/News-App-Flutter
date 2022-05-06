import 'package:get/get.dart';
import 'package:news_app/data/local/dao/user_dao.dart';

class UserRepository {
  final UserDao userDao = Get.find();

  userAuthentication(String email, String password) async {
    final user = await userDao.findUserByEmail(email);
    return user?.email == email && user?.password == password;
  }

  Future<void> userRegistration() async {
    // await userDao.insertPerson(User(
    //     email: 'abc@gmail.com', name: 'Abc Gunarathne', password: 'password'));
    // selectUser();
  }
}
