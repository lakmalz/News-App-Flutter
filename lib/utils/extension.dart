import 'package:news_app/utils/enum.dart';

extension BottomNavigation on eBottomNavigation {
  int get tabIndex {
    switch (this) {
      case eBottomNavigation.home:
        return 0;
      case eBottomNavigation.favourite:
        return 1;
      case eBottomNavigation.profile:
        return 2;
    }
  }
}