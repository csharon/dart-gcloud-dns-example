library xdZoneEdit.xd_zone_edit_controller;

import 'package:angular/angular.dart';
import 'dart:async' show Future;
import 'package:xdZoneEdit/oauth/google_oauth2_service.dart';

@NgController(
  selector: '[app-controller]',
  publishAs: 'appCtrl'
)
class XDZoneEditController {

  String appName = 'xdZoneEdit';
  GoogleOauth2Service gauth;

  XDZoneEditController(this.gauth);

  Future login() => gauth.login().then(
    (resp) {
      print(resp);

    }
  );

}