import 'package:flutter/material.dart';
import 'package:swipe_shop_flutter/custom_components/custom_bottom_navigation_bar.dart';
import 'package:swipe_shop_flutter/navigation/tab_item.dart';
import 'package:swipe_shop_flutter/navigation/tab_navigator.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  var _currentTab = TabItem.scrollPage;
  final _navigatorKeys = {
    TabItem.scrollPage: GlobalKey<NavigatorState>(),
    TabItem.productPage: GlobalKey<NavigatorState>(),
    TabItem.addProductPage: GlobalKey<NavigatorState>(),
    TabItem.accountPage: GlobalKey<NavigatorState>(),
    TabItem.chatPage: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.scrollPage) {
            // select 'main' tab
            _selectTab(TabItem.scrollPage);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.scrollPage), // change these names
          _buildOffstageNavigator(TabItem.productPage),
          _buildOffstageNavigator(TabItem.addProductPage),
          _buildOffstageNavigator(TabItem.accountPage),
          _buildOffstageNavigator(TabItem.chatPage),
        ]),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
        child: activePage[tabItem]!,// this should be our page.
      ),
    );
  }
}