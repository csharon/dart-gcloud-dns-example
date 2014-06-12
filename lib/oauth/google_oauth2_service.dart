library dns_editor.oauth.google_oauth2_service;

import 'package:angular/angular.dart';
import 'dart:async' show Future;
import 'package:google_oauth2_v2_api/oauth2_v2_api_browser.dart' as oauth2client;
import 'package:google_oauth2_client/google_oauth2_browser.dart';
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_browser.dart';
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_client.dart';

@Injectable()
class GoogleOauth2Service {


  static final String clientWeb = '795904425230-d777qbrp5vsbbk9jsqegd4ne115vmtgm.apps.googleusercontent.com';
  static final List<String> scopes = [
      oauth2client.Oauth2.USERINFO_EMAIL_SCOPE,
      oauth2client.Oauth2.USERINFO_PROFILE_SCOPE,
      'openid',
      Dns.NDEV_CLOUDDNS_READWRITE_SCOPE,
      Dns.CLOUD_PLATFORM_SCOPE
  ];

  var _profile;

  GoogleOAuth2 _auth;
  var _oauth2;

  GoogleOauth2Service() {
    _auth = new GoogleOAuth2(clientWeb, scopes, autoLogin: true, tokenLoaded: onTokenLoaded);
    _oauth2 = new oauth2client.Oauth2(_auth);
  }

  void onTokenLoaded(Token token) {

    _oauth2.oauth_token = token.data;
    _oauth2.userinfo.get().then(
        (resp) {
          _profile = resp;
        }
    ).catchError((error) => print(error));
  }


  Future login(){

    return auth.login();
  }

  void logout(){
    auth.logout();
  }

  bool get isAuthenticated {
    return auth.token != null;
  }

  GoogleOAuth2 get auth => _auth;
  Token get accessToken => _auth.token.data;
  Object get profile => _profile;

}