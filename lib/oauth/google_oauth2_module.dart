library dns_editor.oauth.google_oauth2_module;

import 'package:angular/angular.dart';
import 'package:dns_editor/oauth/google_oauth2_service.dart';

class GoogleOauth2Module extends Module {
  GoogleOauth2Module() {
    type(GoogleOauth2Service);
  }
}