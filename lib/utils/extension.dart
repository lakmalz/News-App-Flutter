import 'package:flutter/material.dart';
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

extension ContextHelper on BuildContext{
  showModal(Widget modal) {
    showModalBottomSheet(
      context: this,
      backgroundColor: Colors.transparent,
      builder: (ctx) => SafeArea(child: modal),
      isScrollControlled: true,
    );
  }

  dimissKeyBoard(){
    FocusScopeNode currentFocus = FocusScope.of(this);
  }
}