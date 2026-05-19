import 'package:get/get.dart';

class EnTrans extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'home': 'Home',
      'login': 'Login',
      'count': 'Count: @count', // <-- 这里加占位符 %count%
      'clickAdd': 'Click Add',
      'loadData': 'Load Data',
      'account': 'Account',
      'password': 'Password',
      'pleaseInputAccount': 'Please input account',
      'pleaseInputPassword': 'Please input password',
      'loginSuccess': 'Login Success',
      'switchTheme': 'Switch Theme',
      'switchLang': 'Switch Language',
      'error': 'Error',
      'success': 'Success',
      'networkError': 'Network Error',
      'timeout': 'Request Timeout',
    },
  };
}