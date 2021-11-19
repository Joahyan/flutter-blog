import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/pages/common/bar/common_bar.dart';
import 'package:flutter_application/pages/common/button/common_button.dart';
import 'package:flutter_application/utils/validator_utils.dart';

class RegisterPage extends StatefulWidget {
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  final _registerKey = GlobalKey<FormState>();

  TextEditingController _uNameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  TextEditingController _confirmPwdController = new TextEditingController();
  TextEditingController _telController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonBar(
        title: 'Register',
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
          // padding: EdgeInsets.all(24.0),
          child: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/images/bg.png',
            height: 240,
            fit: BoxFit.cover,
          )),
          Positioned.fill(
              child: Container(
                padding: EdgeInsets.all(24.0),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: _uNameController,
                    style: TextStyle(color: Color(0xffffffff)),
                    cursorColor: Color(0xffffffff),
                    decoration: InputDecoration(
                        labelText: '用户名',
                        hintText: '手机号', //邮箱
                        labelStyle: TextStyle(color: Color(0xffffffff)),
                        hintStyle: TextStyle(color: Color(0xffffffff)),
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
                    style: TextStyle(color: Color(0xffffffff)),
                    cursorColor: Color(0xffffffff),
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: '密码',
                        labelText: '密码',
                        labelStyle: TextStyle(color: Color(0xffffffff)),
                        hintStyle: TextStyle(color: Color(0xffffffff)),
                        icon: Icon(CupertinoIcons.lock)),
                  ),
                  TextFormField(
                    controller: _confirmPwdController,
                    style: TextStyle(color: Color(0xffffffff)),
                    cursorColor: Color(0xffffffff),
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: '再次确认密码',
                        labelText: '再次确认密码',
                        labelStyle: TextStyle(color: Color(0xffffffff)),
                        hintStyle: TextStyle(color: Color(0xffffffff)),
                        icon: Icon(CupertinoIcons.lock)),
                  ),
                  TextFormField(
                    controller: _emailController,
                    style: TextStyle(color: Color(0xffffffff)),
                    cursorColor: Color(0xffffffff),
                    decoration: InputDecoration(
                        hintText: '邮箱',
                        labelText: '邮箱',
                        labelStyle: TextStyle(color: Color(0xffffffff)),
                        hintStyle: TextStyle(color: Color(0xffffffff)),
                        icon: Icon(CupertinoIcons.lock)),
                  ),
                  TextFormField(
                    controller: _telController,
                    style: TextStyle(color: Color(0xffffffff)),
                    cursorColor: Color(0xffffffff),
                    decoration: InputDecoration(
                        hintText: '手机号',
                        labelText: '手机号',
                        labelStyle: TextStyle(color: Color(0xffffffff)),
                        hintStyle: TextStyle(color: Color(0xffffffff)),
                        icon: Icon(CupertinoIcons.lock)),
                  ),
                  // 登陆按钮
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: CommonButton(
                      text: 'Register',
                      onTap: () => {
                        //  登陆接入
                        if ((_registerKey.currentState as FormState).validate())
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
            ),
          ))
        ],
      )
          // Form(
          //   child: ,
          // ),
          ),
    );
  }
}
