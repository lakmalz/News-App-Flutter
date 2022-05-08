import 'package:flutter/material.dart';
import 'package:news_app/modules/dashboard/components/bottom_menu_icon.dart';

import 'package:news_app/utils/enum.dart';
import 'package:news_app/utils/extension.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/resources.dart';

class FloatingBottomNavigationBar extends StatelessWidget {
  const FloatingBottomNavigationBar({
    Key? key,
    required this.onTap,
    required this.selectedIndex,
  }) : super(key: key);

  final Function(int) onTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration(),
      child: Card(
        elevation: 0,
        color: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomMenuIcon(
              icon: Resources.icHome,
              isSelected: selectedIndex == eBottomNavigation.home.tabIndex,
              onPressed: () => onTap(eBottomNavigation.home.tabIndex),
            ),
            BottomMenuIcon(
              icon: Resources.icFavourite,
              isSelected: selectedIndex == eBottomNavigation.favourite.tabIndex,
              onPressed: () => onTap(eBottomNavigation.favourite.tabIndex),
            ),
            BottomMenuIcon(
              icon: Resources.icProfile,
              isSelected: selectedIndex == eBottomNavigation.profile.tabIndex,
              onPressed: () => onTap(eBottomNavigation.profile.tabIndex),
            ),
          ],
        ),
      ),
    );
  }

  _boxDecoration() => BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black87.withOpacity(0.05), 
            offset: const Offset(0, 25),
            blurRadius: 40,
          ),
        ],
      );
}
