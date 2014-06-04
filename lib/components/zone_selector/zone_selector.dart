library xdZoneEdit.components.zone_selector.zone_selector;

import 'package:angular/angular.dart';
import 'dart:async' show Future;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_client.dart';
import 'package:xdZoneEdit/oauth/google_oauth2_service.dart';
import 'package:xdZoneEdit/dns/google_cloud_dns.dart';
import 'package:bootjack/bootjack.dart';

@Component(
    selector: 'zone-selector',
    templateUrl: 'packages/xdZoneEdit/components/zone_selector/zone_selector.html',
    cssUrl: 'packages/xdZoneEdit/components/zone_selector/zone_selector.css',
    publishAs: 'zoneSelector',
    useShadowDom: false
)
class ZoneSelector {

  GoogleOauth2Service gas;
  String projectName;
  Project project;
  ManagedZone selectedZone;
  List<ManagedZone> zones;
  GoogleCloudDns dnsClient;

  String get selectedZoneName {
    if (selectedZone == null) {
      return 'Select Zone';
    } else {
      return selectedZone.dnsName;
    }
  }

  bool get isAuthenticated {
    if(gas.isAuthenticated) {
      dnsClient.createDnsClient();
    }
    return gas.isAuthenticated;
  }

  ZoneSelector(this.gas, this.dnsClient) {
    Dropdown.use();
  }

  void loadZones() {

    dnsClient.dns.managedZones.list(projectName).then((zoneList) {
      zones = zoneList.managedZones;
    })
    .catchError((error) => print(error));

  }

  void selectZone(ManagedZone zone) {
    selectedZone = zone;
  }


}