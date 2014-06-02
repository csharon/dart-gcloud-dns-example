library xdZoneEdit.xd_zone_edit_module;

import 'package:angular/angular.dart';
import 'package:xdZoneEdit/xd_zone_edit_controller.dart';
import 'package:xdZoneEdit/oauth/google_oauth2_service.dart';
import 'package:xdZoneEdit/dns/google_cloud_dns.dart';

class XDZoneEditModule extends Module {
  XDZoneEditModule() {
    type(GoogleOauth2Service);
    type(GoogleCloudDns);
    type(XDZoneEditController);
  }
}