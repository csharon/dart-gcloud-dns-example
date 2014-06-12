library dns_editor.components.app_header.app_header;

import 'package:angular/angular.dart';
import 'package:dns_editor/oauth/google_oauth2_service.dart';
import 'package:bootjack/bootjack.dart';

@Component(
  selector: 'app-header',
  templateUrl: 'packages/dns_editor/components/app_header/app_header.html',
  cssUrl: 'packages/dns_editor/components/app_header/app_header.css',
  publishAs: 'appHeader',
  useShadowDom: false
)
class AppHeader {

  GoogleOauth2Service gas;
  String appName = 'GCloud DNS Editor';

  AppHeader(this.gas){
    Dropdown.use();
  }

  bool get isAuthenticated => gas.isAuthenticated;
  String get userPic => gas.profile != null ? gas.profile.picture : '';

  void login() {
    gas.login();
  }

  void logout() {
    gas.logout();
  }
}