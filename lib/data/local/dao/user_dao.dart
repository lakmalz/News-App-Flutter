import 'package:floor/floor.dart';
import 'package:news_app/data/local/entity/user.dart';

@dao
abstract class UserDao{
  
  @Query('SELECT * FROM User WHERE email = :email')
  Future<User?> findUserByEmail(String email);
  
  @insert
  Future<void> insertPerson(User person);
}