library xdZoneEdit.components.app_header.app_header;

import 'package:angular/angular.dart';
import 'package:xdZoneEdit/oauth/google_oauth2_service.dart';

@Component(
  selector: 'app-header',
  templateUrl: 'packages/xdZoneEdit/components/app_header/app_header.html',
  cssUrl: 'packages/xdZoneEdit/components/app_header/app_header.css',
  publishAs: 'appHeader'
)
class AppHeader {

  GoogleOauth2Service gas;
  String appName = 'xdZoneEdit';

  AppHeader(this.gas);

  bool get isAuthenticated => gas.isAuthenticated;

  void login() {
    gas.login();
  }

  void logout() {
    gas.logout();
  }
}