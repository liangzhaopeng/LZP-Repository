import 'package:community/network/network_request.dart';
import 'package:community/utils/as_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RegisterPage extends StatefulWidget {

  static const routeName = "/register";

  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final GlobalKey _formKey = GlobalKey<FormState>();
  late String _account, _password, _cpassword;
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
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
              buildPasswordTextField(), // 密码
              const SizedBox(height: 30),
              buildConfirmPasswordTextField(),
              const SizedBox(height: 60),
              buildLoginButton(context), // 登录按钮
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAccountTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Account'),
      validator: (v) {
        if (v!.isEmpty) {
          return 'Enter account number';
        }
        return null;
      },
      onSaved: (v) => _account = v!,
    );
  }

  Widget buildPasswordTextField() {
    return TextFormField(
        obscureText: true,
        onSaved: (v) => _password = v!,
        controller: _passwordController,
        validator: (v) {
          if (v!.isEmpty) {
            return 'Enter password';
          }
          return null;
        },
        decoration: const InputDecoration(
            labelText: "Password",
        )
    );
  }

  Widget buildConfirmPasswordTextField() {
    return TextFormField(
        obscureText: true,
        onSaved: (v) => _cpassword = v!,
        validator: (v) {
          if (v!.isEmpty) {
            return 'Confirm password';
          }else if (v != _passwordController.text) {
            return "Password doesn't match";
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: "Confirm Password",
        )
    );
  }

  Widget buildLoginButton(BuildContext ctx) {
    return Align(
      child: SizedBox(
        height: 44,
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            // 设置圆角
              shape: MaterialStateProperty.all(const StadiumBorder(
                  side: BorderSide(style: BorderStyle.none)))),
          child: const Text('Register',style: TextStyle(fontSize: 17),),
          onPressed: () {
            // 表单校验通过才会继续执行
            if ((_formKey.currentState as FormState).validate()) {
              (_formKey.currentState as FormState).save();
              //TODO 执行注册方法
              // print('loginName: $_account, password: $_password');
              final params = {'loginName':_account, 'password':_password};
              EasyLoading.show(status: 'Register...',);

              HTTPRqeust.request("register", method: 'post', params: params).then((response) {
                if (response['code'] == 0) {
                  EasyLoading.showSuccess('Register Success');
                  Future.delayed(const Duration(seconds: 1),() {
                    Navigator.pop(context);
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
}
