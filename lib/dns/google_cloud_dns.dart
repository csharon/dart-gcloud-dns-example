library xdZoneEdit.dns.google_cloud_dns;

import 'package:angular/angular.dart';
import 'dart:async' show Future;
import "package:google_oauth2_client/google_oauth2_browser.dart";
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_browser.dart' as dnsclient;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_client.dart';

@NgInjectableService()
class GoogleCloudDns {

  var auth;
  var dns;

  GoogleCloudDns(this.auth);


}