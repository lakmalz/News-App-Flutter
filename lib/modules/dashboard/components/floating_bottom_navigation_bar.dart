import 'package:flutter/material.dart';

import 'package:news_app/utils/enum.dart';
import 'package:news_app/utils/extension.dart';
import 'package:news_app/utils/global_widgets/v_spacer.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/resources.dart';
import 'package:news_app/utils/styles/styles.dart';

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
              isSelected: selectedIndex == eBottomNavigation.home.tabIndex,
              onPressed: () => onTap(eBottomNavigation.home.tabIndex),
            ),
            _buildTabIcon(
              icon: Resources.icFavourite,
              isSelected: selectedIndex == eBottomNavigation.favourite.tabIndex,
              onPressed: () => onTap(eBottomNavigation.favourite.tabIndex),
            ),
            _buildTabIcon(
              icon: Resources.icProfile,
              isSelected: selectedIndex == eBottomNavigation.profile.tabIndex,
              onPressed: () => onTap(eBottomNavigation.profile.tabIndex),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabIcon({
    required String icon,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(34, 12, 24, 8),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              color: isSelected ? AppColors.primaryColor : AppColors.greyColor,
            ),
            const VSpacer(space: 1),
            Text(
              Resources.lableHome,
              style: Styles.regular10pxTextStyle(
                  color:
                      isSelected ? AppColors.brownColor : AppColors.greyColor),
            ),
          ],
        ),
      ),
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
