library dns_editor.components.zone_form.zone_form;

import 'package:angular/angular.dart';
import 'dart:async' show Future;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_client.dart';
import 'package:dns_editor/dns/project_manager.dart';
import 'package:dns_editor/dns/zone_manager.dart';
import 'package:dquery/dquery.dart';
import 'package:bootjack/bootjack.dart';

@Component(
    selector: 'zone-form',
    templateUrl: 'packages/dns_editor/components/zone_form/zone_form.html',
    cssUrl: 'packages/dns_editor/components/zone_form/zone_form.css',
    publishAs: 'zoneForm',
    useShadowDom: false
)
class ZoneForm {

  Map zone;
  ProjectManager pm;
  ZoneManager zm;


  ZoneForm(this.pm, this.zm) {
    Modal.use();
    Alert.use();
    Transition.use();
    zone = new Map();
  }

  void create() {
    zm.create(pm.project.id, zone).then((_) {
      zone = new Map();
      Modal modal = Modal.wire($('#createZoneModal'));
      modal.hide();
    });
  }
}