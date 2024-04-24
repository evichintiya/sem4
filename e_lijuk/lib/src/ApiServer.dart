import 'dart:html';

class ApiServer{
  static Uri url(url){
    Uri Server = Uri.parse("http:/172.16.103.120/laravelssem4/mobile" + url);
    return Server;
  }
}