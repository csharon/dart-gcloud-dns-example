library xdZoneEdit.xd_zone_edit_module;

import 'package:angular/angular.dart';
import 'package:xdZoneEdit/xd_zone_edit_controller.dart';
import 'package:xdZoneEdit/oauth/google_oauth2_service.dart';
import 'package:xdZoneEdit/dns/google_cloud_dns.dart';
import 'package:xdZoneEdit/local_storage/local_storage_service.dart';
import 'package:xdZoneEdit/components/app_header/app_header.dart';

class XDZoneEditModule extends Module {
  XDZoneEditModule() {
    type(LocalStorageService);
    type(GoogleOauth2Service);
    type(GoogleCloudDns);
    type(XDZoneEditController);
    type(AppHeader);
  }
}