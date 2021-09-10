import 'package:flutter_application/utils/regex_constants.dart';

class ValidatorUtils {

  /// 精确验证是否是手机号
  static bool isMobileExact(String input) {
    return matches(RegexConstants.REGEX_MOBILE_EXACT, input);
  }

  /// 返回输入是否匹配电子邮件的正则表达式。
  static bool isEmail(String input) {
    return matches(RegexConstants.REGEX_EMAIL, input);
  }

  /// 返回输入是否匹配正则表达式。
  static bool matches(String regex, String input) {
    if (input.isEmpty) {
      return false;
    }
    return RegExp(regex).hasMatch(input);
  }

  /// 判断内容是否符合正则
  static bool hasMatch(String s, Pattern p){
    return (s == null) ? false : RegExp(p as String).hasMatch(s);
  }

}