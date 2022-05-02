import 'package:flutter/material.dart';

import 'package:news_app/utils/enum.dart';
import 'package:news_app/utils/extension.dart';
import 'package:news_app/utils/styles/theme_extension.dart';

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
        color: Colors.white, //TODO use theme color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTabIcon(
              icon: 'assets/images/ic_home.png',
              iconColor: selectedIndex == eBottomNavigation.home.tabIndex
                  ? context.primaryColor
                  : context.greyColor,
              onPressed: () => onTap(eBottomNavigation.home.tabIndex),
            ),
            _buildTabIcon(
              icon: 'assets/images/ic_favourite.png',
              iconColor: selectedIndex == eBottomNavigation.favourite.tabIndex
                  ? context.primaryColor
                  : context.greyColor,
              onPressed: () => onTap(eBottomNavigation.favourite.tabIndex),
            ),
            _buildTabIcon(
              icon: 'assets/images/ic_profile.png',
              iconColor: selectedIndex == eBottomNavigation.profile.tabIndex
                  ? context.primaryColor
                  : context.greyColor,
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
