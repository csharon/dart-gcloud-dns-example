library xdZoneEdit.oauth.google_oauth2_service;

import 'package:angular/angular.dart';
import 'dart:async' show Future;
import "package:google_oauth2_client/google_oauth2_browser.dart";
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_browser.dart' as dnsclient;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_client.dart';

@NgInjectableService()
class GoogleOauth2Service {


  static final String clientWeb = '795904425230-d777qbrp5vsbbk9jsqegd4ne115vmtgm.apps.googleusercontent.com';
  static final List<String> scopes = [
      'openid',
      dnsclient.Dns.NDEV_CLOUDDNS_READWRITE_SCOPE,
      dnsclient.Dns.CLOUD_PLATFORM_SCOPE
  ];

  var dns;
  bool isAuthenticated;
  var auth;

  GoogleOauth2Service();

  void init(){
    auth = new GoogleOAuth2(clientWeb, scopes, tokenLoaded: oauthReady);
  }


  void oauthReady(Token token) {

    isAuthenticated = true;
    dns = new dnsclient.Dns(auth);
    dns.oauth_token = auth.token.data;
    Project project = dns.projects.get('fresh-gravity-595')
    .then(
        (proj) {
          print(proj);
        })
    .catchError((error) {
      print(error);
    });
  }

  Future login(){
    init();
    return auth.login();
  }

}