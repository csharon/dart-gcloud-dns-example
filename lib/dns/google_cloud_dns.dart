library dns_editor.dns.google_cloud_dns;

import 'package:angular/angular.dart';
import 'dart:async' show Future;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_browser.dart' as dnsclient;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_client.dart';
import 'package:dns_editor/oauth/google_oauth2_service.dart';

@Injectable()
class GoogleCloudDns {

  GoogleOauth2Service gas;
  var dns;

  GoogleCloudDns(this.gas);

  void createDnsClient() {
    dns = new dnsclient.Dns(gas.auth);
    dns.oauth_token = gas.accessToken;

  }


}