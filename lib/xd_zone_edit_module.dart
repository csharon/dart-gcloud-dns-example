library xdZoneEdit.xd_zone_edit_module;

import 'package:angular/angular.dart';
import 'package:xdZoneEdit/oauth/google_oauth2_service.dart';
import 'package:xdZoneEdit/dns/google_cloud_dns.dart';
import 'package:xdZoneEdit/local_storage/local_storage_service.dart';
import 'package:xdZoneEdit/dns/project_manager.dart';
import 'package:xdZoneEdit/dns/zone_manager.dart';
import 'package:xdZoneEdit/components/app_header/app_header.dart';
import 'package:xdZoneEdit/components/zone_selector/zone_selector.dart';
import 'package:xdZoneEdit/components/zone_form/zone_form.dart';
import 'package:xdZoneEdit/components/zone_record_list/zone_record_list.dart';

class XDZoneEditModule extends Module {
  XDZoneEditModule() {
    type(LocalStorageService);
    type(GoogleOauth2Service);
    type(GoogleCloudDns);
    type(ProjectManager);
    type(ZoneManager);
    type(AppHeader);
    type(ZoneSelector);
    type(ZoneForm);
    type(ZoneRecordList);
  }
}