library xdZoneEdit.components.app_header.app_header;

import 'package:angular/angular.dart';
import 'package:xdZoneEdit/oauth/google_oauth2_service.dart';
import 'package:bootjack/bootjack.dart';

@Component(
  selector: 'app-header',
  templateUrl: 'packages/xdZoneEdit/components/app_header/app_header.html',
  cssUrl: 'packages/xdZoneEdit/components/app_header/app_header.css',
  publishAs: 'appHeader',
  useShadowDom: false
)
class AppHeader {

  GoogleOauth2Service gas;
  String appName = 'xdZoneEdit';

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