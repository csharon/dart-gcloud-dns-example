library xdZoneEdit.xd_zone_edit_controller;

import 'package:angular/angular.dart';
import 'dart:async' show Future;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_client.dart';
import 'package:xdZoneEdit/oauth/google_oauth2_service.dart';
import 'package:xdZoneEdit/dns/google_cloud_dns.dart';

@NgController(
  selector: '[app-controller]',
  publishAs: 'appCtrl'
)
class XDZoneEditController {

  String appName = 'xdZoneEdit';
  String projectName;
  Project project;
  GoogleOauth2Service gauth;
  GoogleCloudDns dnsClient;
  bool get isAuthenticated {
    if(gauth.isAuthenticated) {
      dnsClient.createDnsClient();
    }
    return gauth.isAuthenticated;
  }

  XDZoneEditController(this.gauth, this.dnsClient) {

  }

  Future login() => gauth.login().then(
    (_) {

      //isAuthenticated = true;
    }
  );

  void loadProject() {
    dnsClient.dns.projects.get(projectName).then((proj) {
      project = proj;
    });
  }

  void logout() {
    gauth.logout();
    //isAuthenticated = false;
  }

}