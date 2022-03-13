import 'package:flutter/material.dart';
import 'package:swipe_shop_flutter/chat_test/widgets/recents_chats.dart';
import 'package:swipe_shop_flutter/screens/account_page.dart';
import 'package:swipe_shop_flutter/screens/chat_page.dart';
import 'package:swipe_shop_flutter/screens/locator_page.dart';
import 'package:swipe_shop_flutter/screens/my_profile_page.dart';
import 'package:swipe_shop_flutter/screens/product_page.dart';
import 'package:swipe_shop_flutter/screens/people_page.dart';
import 'package:swipe_shop_flutter/screens/request_page.dart';

enum TabItem { scrollPage, productPage, addProductPage, accountPage, chatPage }


const Map<TabItem, Widget> activePage = {
  TabItem.productPage: LocatorPage(),
  TabItem.scrollPage: ScrollPage(),
  TabItem.addProductPage: MyProfilePage(personD: "test"),
  TabItem.accountPage: RecentChats(),
  TabItem.chatPage: AccountPage(),
};