// ignore_for_file: depend_on_referenced_packages

import 'package:community/login/register_page.dart';
import 'package:community/tabcontroller/tab_controller.dart';
import 'package:community/utils/as_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import '../network/network_request.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final GlobalKey _formKey = GlobalKey<FormState>();
  late String _account, _password;
  bool _isObscure = true;
  Color _eyeColor = Colors.grey;
  bool _isRemember = SpUtil.preferences?.getBool("rememberPWD") ?? false;
  final TextEditingController _accountVC = TextEditingController();
  final TextEditingController _passwordVC = TextEditingController();

  @override
  dispose() {
    if (kDebugMode) {
      print("登录页面销毁");
    }
    _accountVC.dispose();
    _passwordVC.dispose();
    super.dispose();
  }

  @override
  initState() {
    super.initState();
    if (_isRemember) {
      _account = SpUtil.preferences?.getString("loginName") ?? "";
      _accountVC.text = _account;

      _password = SpUtil.preferences?.getString("password") ?? "";
      _passwordVC.text = _password;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(height: 60),
              buildAccountTextField(), // 账号
              const SizedBox(height: 30),
              buildPasswordTextField(context), // 密码
              const SizedBox(height: 20),
              _buildRememberAndRegisterRow(),
              const SizedBox(height: 60),
              buildLoginButton(context), // 登录按钮
            ],
          ),
        ),
      ),
    );
  }

  Row _buildRememberAndRegisterRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            RoundCheckBox(
                size: 18,
                checkedWidget: const Icon(Icons.check, size: 12, color: Colors.white,),
                checkedColor: Colors.blue,
                borderColor: _isRemember ? Colors.blue : const Color(0xff333333),
                isChecked: _isRemember,
                onTap: (selected){
                  setState(() {
                    _isRemember = selected!;
                  });
                }
            ),
            const SizedBox(width: 6),
            GestureDetector(
              child: const Text('remember password'),
              onTap: (){
                setState(() {
                  _isRemember = !_isRemember;
                });
              },
            ),
          ],
        ),
        TextButton(
          onPressed: (){
            Navigator.pushNamed(context, RegisterPage.routeName);
          },
          child: const Text('user register'),
        )
      ],
    );
  }

  Widget buildAccountTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Account'),
      controller: _accountVC,
      validator: (v) {
        if (v!.isEmpty) {
          return 'Enter account number';
        }
        return null;
      },
      onSaved: (v) => _account = v!,
    );
  }

  Widget buildPasswordTextField(BuildContext context) {
    return TextFormField(
        obscureText: _isObscure, // 是否显示文字
        controller: _passwordVC,
        onSaved: (v) => _password = v!,
        validator: (v) {
          if (v!.isEmpty) {
            return 'Enter password';
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: "Password",
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor,
              ),
              onPressed: () {
                // 修改 state 内部变量, 且需要界面内容更新, 需要使用 setState()
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = (_isObscure
                      ? Colors.grey
                      : Theme.of(context).primaryColor);
                });
              },
            )));
  }

  Widget buildLoginButton(BuildContext ctx) {
    return Align(
      child: SizedBox(
        height: 44,
        width: double.infinity,
        child: ElevatedButton(
          key:Key("registration"),
          style: ButtonStyle(
            // 设置圆角
              shape: MaterialStateProperty.all(const StadiumBorder(
                  side: BorderSide(style: BorderStyle.none)))),
          child: const Text('Sign In',style: TextStyle(fontSize: 17),),
          onPressed: () {
            // 表单校验通过才会继续执行
            if ((_formKey.currentState as FormState).validate()) {
              (_formKey.currentState as FormState).save();
              //TODO 执行登录方法
              //print('email: $_account, password: $_password');
              final params = {'loginName':_account, 'password':_password};

              EasyLoading.show(status: 'Login...',);
              var hasSuccess = false;
              HTTPRqeust.request("login", method: 'post', params: params).then((response) {
                if (response['code'] == 0) {
                  EasyLoading.showSuccess('Login Success').then((value) => hasSuccess = true);
                  var userId = response["data"];
                  EasyLoading.addStatusCallback((status) {
                    if (status == EasyLoadingStatus.dismiss && hasSuccess) {
                      hasSuccess = false;
                      SpUtil.preferences?.setBool('isLogin', true);
                      SpUtil.preferences?.setInt("userId", userId);
                      SpUtil.preferences?.setBool("rememberPWD", _isRemember);
                      if (_isRemember) {
                        SpUtil.preferences?.setString("loginName", _account);
                        SpUtil.preferences?.setString("password", _password);
                      }else {
                        SpUtil.preferences?.remove("loginName");
                        SpUtil.preferences?.remove("password");
                      }
                      _jumpToMainPage();

                    }
                  });
                }else {
                  EasyLoading.showInfo(response['msg']);
                }
              }).onError((error, stackTrace) {
                EasyLoading.dismiss();
              });
            }
          },
        ),
      ),
    );
  }

  void _jumpToMainPage() {

    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            pageBuilder: (context, animation, secondAnimation) =>
            const MyTabbarController(),
            transitionsBuilder:
                (context, animation, secondAnimation, child) =>
                FadeTransition(
                  opacity: animation,
                  child: child,
                )),
            (route) => false);
    // Navigator.pushNamedAndRemoveUntil(context, MyTabbarController.routeName, (route) => false);
  }


}
