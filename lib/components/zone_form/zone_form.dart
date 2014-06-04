library xdZoneEdit.components.zone_form.zone_form;

import 'package:angular/angular.dart';
import 'dart:async' show Future;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_client.dart';
import 'package:xdZoneEdit/dns/project_manager.dart';
import 'package:xdZoneEdit/dns/zone_manager.dart';
import 'package:bootjack/bootjack.dart';

@Component(
    selector: 'zone-form',
    templateUrl: 'packages/xdZoneEdit/components/zone_form/zone_form.html',
    cssUrl: 'packages/xdZoneEdit/components/zone_form/zone_form.css',
    publishAs: 'zoneForm',
    useShadowDom: false
)
class ZoneForm {

  Map zone;
  ProjectManager pm;
  ZoneManager zm;


  ZoneForm(ProjectManager this.pm, ZoneManager this.zm) {
    zone = new Map();
  }

  void create() {
    zm.create(pm.project.id, zone).then((ManagedZone resp) {
      print(resp);
    });
  }
}