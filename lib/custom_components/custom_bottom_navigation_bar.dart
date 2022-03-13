import 'package:flutter/material.dart';
import 'package:swipe_shop_flutter/navigation/tab_item.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({required this.currentTab, required this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        showSelectedLabels: false, // this gives error
        showUnselectedLabels: false, //this gives error
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            activeIcon: const Icon(
              Icons.people,
              color: Colors.grey,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_pin,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            activeIcon: const Icon(
              Icons.location_pin,
              color: Colors.grey,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            activeIcon: const Icon(
              Icons.account_circle,
              color: Colors.grey,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.send,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            activeIcon: const Icon(
              Icons.send,
              color: Colors.grey,
            ),
            label: "",
          ),
          /*BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            activeIcon: const Icon(
              Icons.account_circle,
              color: Colors.grey,
            ),
            label: "",
          ),*/
        ],
        selectedItemColor: Colors.amber[800],
        onTap: (index) => onSelectTab(
          TabItem.values[index],
        ),
        currentIndex: currentTab.index,
      ),
    );
  }
}