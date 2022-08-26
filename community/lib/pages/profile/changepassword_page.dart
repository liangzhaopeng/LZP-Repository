import 'package:community/login/login_page.dart';
import 'package:community/network/network_request.dart';
import 'package:community/utils/as_util.dart';
import 'package:community/widgets/text_filed_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ChangePasswordPage extends StatefulWidget {
  static const routeName = "/changepassword";
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {

  final GlobalKey _formKey = GlobalKey<FormState>();
  late String _opassword, _npassword, _cpassword;
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
        title: const Text('Change Password'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            buildPasswordTextField(),
            const SizedBox(height: 30),
            buildNewPasswordTextField(),
            const SizedBox(height: 30),
            buildConfirmPasswordTextField(),
            const SizedBox(height: 60),
            buildSubmitButton(), // 登录按钮
          ],
        ),
      ),
    );
  }

  Widget buildPasswordTextField() {
    return TextFormField(
        obscureText: true,
        onSaved: (v) => _opassword = v!,
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

  Widget buildNewPasswordTextField() {
    return TextFormField(
        obscureText: true,
        onSaved: (v) => _npassword = v!,
        controller: _passwordController,
        validator: (v) {
          if (v!.isEmpty) {
            return 'Enter new password';
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: "New Password",
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

  Widget buildSubmitButton() {
    return Align(
      child: SizedBox(
        height: 44,
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            // 设置圆角
              shape: MaterialStateProperty.all(const StadiumBorder(
                  side: BorderSide(style: BorderStyle.none)))),
          child: const Text('Submit',style: TextStyle(fontSize: 17),),
          onPressed: () {
            // 表单校验通过才会继续执行
            if ((_formKey.currentState as FormState).validate()) {
              (_formKey.currentState as FormState).save();

              final params = {'userId':SpUtil.preferences?.getInt("userId"), 'oldPassword':_opassword, 'newPassword':_npassword};
              EasyLoading.show(status: 'Submitting...',);

              HTTPRqeust.request("modify/password", method: 'post', params: params).then((response) {
                if (response['code'] == 0) {
                  EasyLoading.showSuccess('Register Success');
                  //修改密码后需重新登录
                  SpUtil.preferences?.setBool("isLogin", false);
                  SpUtil.preferences?.remove("userId");
                  Navigator.of(context).pushAndRemoveUntil(
                      PageRouteBuilder(
                          pageBuilder: (context, animation, secondAnimation) =>
                          const LoginPage(),
                          transitionsBuilder:
                              (context, animation, sencodAnimation, child) =>
                              FadeTransition(
                                opacity: animation,
                                child: child,
                              )),
                          (route) => false);
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
