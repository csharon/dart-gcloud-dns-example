library dns_editor.xd_zone_edit_module;

import 'package:angular/angular.dart';
import 'package:dns_editor/oauth/google_oauth2_service.dart';
import 'package:dns_editor/dns/google_cloud_dns.dart';
import 'package:dns_editor/local_storage/local_storage_service.dart';
import 'package:dns_editor/dns/project_manager.dart';
import 'package:dns_editor/dns/zone_manager.dart';
import 'package:dns_editor/dns/change_manager.dart';
import 'package:dns_editor/components/app_header/app_header.dart';
import 'package:dns_editor/components/zone_selector/zone_selector.dart';
import 'package:dns_editor/components/zone_form/zone_form.dart';
import 'package:dns_editor/components/zone_record_list/zone_record_list.dart';
import 'package:dns_editor/components/zone_confirm_delete/zone_confirm_delete.dart';
import 'package:dns_editor/components/resource_record_form/resource_record_form.dart';

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
    type(ZoneConfirmDelete);
    type(ChangeManager);
    type(ResourceRecordForm);
  }
}