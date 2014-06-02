library xdZoneEdit.dns.google_cloud_dns;

import 'package:angular/angular.dart';
import 'dart:async' show Future;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_browser.dart' as dnsclient;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_client.dart';
import 'package:xdZoneEdit/oauth/google_oauth2_service.dart';

@NgInjectableService()
class GoogleCloudDns {

  GoogleOauth2Service gas;
  var dns;

  GoogleCloudDns(this.gas);

  void createDnsClient() {
    dns = new dnsclient.Dns(gas.auth);
    dns.oauth_token = gas.auth.token.data;

  }


}