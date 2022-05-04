import 'package:flutter/material.dart';

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
            _buildTabIcon(
              icon: Resources.icHome,
              iconColor: selectedIndex == eBottomNavigation.home.tabIndex
                  ? AppColors.primaryColor
                  : AppColors.greyColor,
              onPressed: () => onTap(eBottomNavigation.home.tabIndex),
            ),
            _buildTabIcon(
              icon: Resources.icFavourite,
              iconColor: selectedIndex == eBottomNavigation.favourite.tabIndex
                  ? AppColors.primaryColor
                  : AppColors.greyColor,
              onPressed: () => onTap(eBottomNavigation.favourite.tabIndex),
            ),
            _buildTabIcon(
              icon: Resources.icProfile,
              iconColor: selectedIndex == eBottomNavigation.profile.tabIndex
                  ? AppColors.primaryColor
                  : AppColors.greyColor,
              onPressed: () => onTap(eBottomNavigation.profile.tabIndex),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabIcon({
    required String icon,
    required Color iconColor,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: onPressed,
          color: iconColor,
          icon: Image.asset(
            icon,
            color: iconColor,
          )),
    );
  }

  _boxDecoration() => BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black87.withOpacity(0.05), //TODO
            offset: const Offset(0, 25),
            blurRadius: 40,
          ),
        ],
      );
}
