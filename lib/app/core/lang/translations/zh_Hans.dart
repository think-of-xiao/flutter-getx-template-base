import 'package:get/get.dart';

class ZhTrans extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'zh_Hans': {
      'home': '首页',
      'login': '登录',
      'count': '计数：@count', // <-- 这里加占位符 %count%
      'clickAdd': '点击 +1',
      'loadData': '加载数据',
      'account': '账号',
      'password': '密码',
      'pleaseInputAccount': '请输入账号',
      'pleaseInputPassword': '请输入密码',
      'loginSuccess': '登录成功',
      'switchTheme': '切换主题',
      'switchLang': '切换语言',
      'error': '错误',
      'success': '成功',
      'networkError': '网络异常',
      'timeout': '请求超时',
    },
  };
}