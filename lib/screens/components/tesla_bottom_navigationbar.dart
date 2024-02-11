import 'package:animated_tesla_car/constanins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TeslaBottomNavigationBar extends StatelessWidget {
  const TeslaBottomNavigationBar({
    super.key,
    required this.selectedTab,
    required this.onTap,
  });

  final int selectedTab;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: selectedTab,
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      items: List.generate(
        navIconsSrc.length,
        (index) => BottomNavigationBarItem(
          icon: SvgPicture.asset(
            navIconsSrc[index],
            colorFilter: ColorFilter.mode(
              index == selectedTab ? primaryColor : Colors.white54,
              BlendMode.srcIn,
            ),
          ),
          label: "",
        ),
      ),
    );
  }
}

List<String> navIconsSrc = [
  'assets/icons/Lock.svg',
  'assets/icons/Charge.svg',
  'assets/icons/Temp.svg',
  'assets/icons/Tyre.svg',
];
