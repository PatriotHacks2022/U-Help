import 'package:flutter/material.dart';
import 'package:swipe_shop_flutter/screens/account_page.dart';
import 'package:swipe_shop_flutter/screens/chat_page.dart';
import 'package:swipe_shop_flutter/screens/product_page.dart';
import 'package:swipe_shop_flutter/screens/people_page.dart';

enum TabItem { scrollPage, productPage, addProductPage, accountPage, chatPage }


const Map<TabItem, Widget> activePage = {
  TabItem.scrollPage: ScrollPage(),
  TabItem.productPage: ProductPage(),
  TabItem.addProductPage: ProductPage(),
  TabItem.accountPage: AccountPage(),
  TabItem.chatPage: ChatPage(),
};