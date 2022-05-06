import 'package:floor/floor.dart';

@entity
class User {
  User({this.id, this.email, this.name, this.password});

  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String? email;
  final String? name;
  final String? password;

}