import 'package:flutter/material.dart';
import 'package:routezy_mobile/app/design_system/app_color.dart';
import 'package:routezy_mobile/app/design_system/app_padding.dart';

class NotchedBottomNavbar extends StatefulWidget {
  const NotchedBottomNavbar({super.key, required this.onTapNavBarItem});

  final ValueChanged<int> onTapNavBarItem;

  @override
  State<NotchedBottomNavbar> createState() => _NotchedBottomNavbarState();
}

class _NotchedBottomNavbarState extends State<NotchedBottomNavbar> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: AppPadding.phLG,
      height: 60,
      color: AppColors.primaryMain,
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Center(
              child: _BottomNavItem(
                icon: Icons.home_filled,
                isActive: _bottomNavIndex == 0,
                onTap: () {
                  widget.onTapNavBarItem(0);
                  if (_bottomNavIndex != 0) {
                    setState(() {
                      _bottomNavIndex = 0;
                    });
                  }
                },
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: _BottomNavItem(
                icon: Icons.settings,
                isActive: _bottomNavIndex == 1,
                onTap: () {
                  widget.onTapNavBarItem(1);
                  if (_bottomNavIndex != 1) {
                    setState(() {
                      _bottomNavIndex = 1;
                    });
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: AnimatedScale(
            scale: isActive ? 1.3 : 1.0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutBack,
            child: Icon(icon, color: AppColors.textWhite),
          ),
        ),

        /// Dot indicator
        if (isActive)
          Container(
            height: 6,
            width: 6,
            margin: AppPadding.ptXS,
            decoration: BoxDecoration(
              color: AppColors.textWhite,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}
