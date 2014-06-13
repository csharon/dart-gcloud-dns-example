library dns_editor.components.zone_confirm_delete.zone_confirm_delete;

import 'package:angular/angular.dart';
import 'dart:async' show Future;
import 'package:dns_editor/dns/zone_manager.dart';
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_client.dart';
import 'package:dquery/dquery.dart';
import 'package:bootjack/bootjack.dart';

@Component(
    selector: 'zone-confirm-delete',
    templateUrl: 'packages/dns_editor/components/zone_confirm_delete/zone_confirm_delete.html',
    cssUrl: 'packages/dns_editor/components/zone_confirm_delete/zone_confirm_delete.css',
    publishAs: 'ctrl',
    useShadowDom: false
)
class ZoneConfirmDelete {

  ZoneManager zm;
  ManagedZone get selectedZone => zm.zone;

  ZoneConfirmDelete(ZoneManager this.zm) {
    Modal.use();
    Alert.use();
    Transition.use();
  }

  void deleteZone() {
    zm.deleteZone().then(
            (_) {
          print('zone deleted');
        }
    ).catchError(
            (error) => print(error)
    );
  }
}