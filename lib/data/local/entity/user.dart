import 'package:floor/floor.dart';

@entity
class User {
  User({this.email, this.name, this.password});

  @primaryKey
  final String? email;
  final String? name;
  final String? password;

}