library dns_editor.components.zone_selector.zone_selector;

import 'package:angular/angular.dart';
import 'dart:async' show Future;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_client.dart';
import 'package:dns_editor/dns/zone_manager.dart';
import 'package:bootjack/bootjack.dart';

@Component(
    selector: 'zone-record-list',
    templateUrl: 'packages/dns_editor/components/zone_record_list/zone_record_list.html',
    cssUrl: 'packages/dns_editor/components/zone_record_list/zone_record_list.css',
    publishAs: 'ctrl',
    useShadowDom: false
)
class ZoneRecordList {

  ZoneManager zm;
  List<ResourceRecordSet> get records => zm.records;

  ZoneRecordList(this.zm){
    Modal.use();
    Alert.use();
    Transition.use();
  }

}