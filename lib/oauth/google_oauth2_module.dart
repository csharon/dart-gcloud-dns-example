library xdZoneEdit.oauth.google_oauth2_module;

import 'package:angular/angular.dart';
import 'package:xdZoneEdit/oauth/google_oauth2_service.dart';

class GoogleOauth2Module extends Module {
  GoogleOauth2Module() {
    type(GoogleOauth2Service);
  }
}