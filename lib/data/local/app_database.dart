import 'dart:async';

import 'package:floor/floor.dart';
import 'package:news_app/data/local/dao/user_dao.dart';
import 'package:news_app/data/local/entity/user.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [User])
abstract class AppDatabase extends FloorDatabase{
  UserDao get userDao;
}