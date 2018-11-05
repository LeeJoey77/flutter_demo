
class Address {
  static const String HostAddr = 'http://117.139.13.231:26840/';

  //登录
  static String getLogOutUrl() {
    return '${HostAddr}rest/auth/logout';
  }
}