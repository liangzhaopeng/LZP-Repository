import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Test login jump', (WidgetTester tester) async {
    //构建应用
    // Main.main();
    //捕获一帧
    await tester.pumpAndSettle();
    //通过key来查找注册按钮
    var registrationBtn = find.byKey(Key('registration'));
    //触发按钮的点击事件
    await tester.tap(registrationBtn);
    //捕获一帧
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 3));

    //判断是否跳转到了注册页
    // expect(HiNavigator.getInstance().getCurrent().routeStatus,
    //     RouteStatus.registration);

    //获取返回按钮，并触发返回上一页
    var backBtn = find.byType(BackButton);
    await tester.tap(backBtn);
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 3));
    //判断是返回到登录页
    // expect(
    //     HiNavigator.getInstance().getCurrent().routeStatus, RouteStatus.login);
  });
}