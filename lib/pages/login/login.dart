import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/pages/common/bar/common_bar.dart';
import 'package:flutter_application/pages/common/button/common_button.dart';
import 'package:flutter_application/utils/validator_utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _uNameController = new TextEditingController();
    TextEditingController _pwdController = new TextEditingController();

    return new Scaffold(
      resizeToAvoidBottomInset: false, // 键盘弹起引起的挤压问题
      appBar: CommonBar(title: 'Login'),
      body: Container(
          padding: EdgeInsets.fromLTRB(12.0, 48.0, 12.0, 0),
          child: Column(
            children: [
              Image.asset('assets/images/juejin_logo.png'),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: _uNameController,
                      decoration: InputDecoration(
                          labelText: '用户名',
                          hintText: '手机号', //邮箱
                          icon: Icon(CupertinoIcons.person)),
                      validator: (value) {
                        bool status = ValidatorUtils.isMobileExact(value!);
                        if (!status) {
                          return '请输入正确的手机号';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _pwdController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: '密码',
                          labelText: '密码',
                          icon: Icon(CupertinoIcons.lock)),
                    ),
                    // 登陆按钮
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: CommonButton(
                        text: '登陆',
                        onTap: () => {
                          //  登陆接入
                          if ((_formKey.currentState as FormState).validate())
                            {
                              //  验证通过提交数据(登录)
                              print(_uNameController.text),
                              print(_pwdController.text)
                            }
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
