import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:news_app/utils/enum.dart';
import 'package:news_app/utils/extension.dart';

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
              icon: const FaIcon(FontAwesomeIcons.houseCrack),
              iconColor: selectedIndex == eBottomNavigation.home.tabIndex
                  ? Colors.pink.shade200
                  : Colors.grey,
              onPressed: () => onTap(eBottomNavigation.home.tabIndex),
            ),
             _buildTabIcon(
              icon: const FaIcon(FontAwesomeIcons.heart),
              iconColor: selectedIndex == eBottomNavigation.favourite.tabIndex
                  ? Colors.pink.shade200
                  : Colors.grey,
              onPressed: () => onTap(eBottomNavigation.favourite.tabIndex),
            ),
            _buildTabIcon(
              icon: const FaIcon(FontAwesomeIcons.personRifle),
              iconColor: selectedIndex == eBottomNavigation.profile.tabIndex
                  ? Colors.pink.shade200
                  : Colors.grey,
              onPressed: () => onTap(eBottomNavigation.profile.tabIndex),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabIcon({
    required Widget icon,
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
        icon: icon
      ),
    );
  }

  _boxDecoration() =>  BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black87.withOpacity(0.05),//TODO
            offset: const Offset(0, 25),
            blurRadius: 40,
          ),
        ],
      );
}
