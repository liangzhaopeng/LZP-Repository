import 'package:community/login/login_page.dart';
import 'package:community/login/register_page.dart';
import 'package:community/message/message_tips.dart';
import 'package:community/pages/home/goods_info_page.dart';
import 'package:community/pages/home/goods_page.dart';
import 'package:community/pages/home/goods_release_page.dart';
import 'package:community/pages/home/housekeeping_category_page.dart';
import 'package:community/pages/home/housekeeping_page.dart';
import 'package:community/pages/home/introduce_page.dart';
import 'package:community/pages/home/orderfood_menu_page.dart';
import 'package:community/pages/home/orderfood_page.dart';
import 'package:community/pages/profile/changepassword_page.dart';
import 'package:community/pages/profile/goods_collection_page.dart';
import 'package:community/pages/profile/goods_record_page.dart';
import 'package:community/pages/profile/housekeeping_record_page.dart';
import 'package:community/pages/profile/order_record_page.dart';
import 'package:community/tabcontroller/tab_controller.dart';

import '../map/gaodemap.dart';

final routes = {

  MyTabbarController.routeName: (ctx) => const MyTabbarController(),
  LoginPage.routeName: (ctx) => const LoginPage(),
  RegisterPage.routeName : (ctx) => const RegisterPage(),
  HouseKeepingPage.routeName : (ctx) => const HouseKeepingPage(),
  OrderFoodPage.routeName : (ctx) => const OrderFoodPage(),
  OrderFoodMenuPage.routeName : (ctx) => const OrderFoodMenuPage(),
  IntroducePage.routeName : (ctx) => const IntroducePage(),
  HouseKeepingCagetoryPage.routeName : (ctx) => const HouseKeepingCagetoryPage(),
  GoodsPage.routeName : (ctx) => const GoodsPage(),
  GoodsInfoPage.routeName : (ctx) => const GoodsInfoPage(),
  GoodsReleasePage.routeName : (ctx) => const GoodsReleasePage(),
  ChangePasswordPage.routeName : (ctx) => const ChangePasswordPage(),
  HousekeepingRecordPage.routeName : (ctx) => const HousekeepingRecordPage(),
  GoodsRecordPage.routeName: (ctx) => const GoodsRecordPage(),
  OrderRecordPage.routeName: (ctx) => const OrderRecordPage(),
  DrawLayout.routeName: (ctx) =>  DrawLayout(),
  GaodeMapPage.routeName: (ctx) =>  const GaodeMapPage(),
  GoodsCollectionPage.routeName: (ctx) =>  const GoodsCollectionPage(),
  // MessageTips.routeName: (ctx) => MessageTips()

};