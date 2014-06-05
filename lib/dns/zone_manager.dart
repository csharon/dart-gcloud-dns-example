library xdZoneEdit.dns.zone_manager;

import 'package:angular/angular.dart';
import 'dart:async' show Future;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_browser.dart' as dnsclient;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_client.dart';
import 'package:xdZoneEdit/dns/google_cloud_dns.dart';

@Injectable()
class ZoneManager {

  GoogleCloudDns dnsService;

  ZoneManager(this.dnsService);

  List<ManagedZone> zones;
  ManagedZone zone;

  Future<ManagedZone> loadZones(String name) {
    return dnsService.dns.managedZones.list(name).then(
      (ManagedZonesListResponse resp) {
        zones = resp.managedZones;
      }
    ).catchError((error) => print(error));
  }

  Future<ManagedZone> create(String projectName, Map item) {
    ManagedZone newZone = new ManagedZone.fromJson(item);
    return dnsService.dns.managedZones.create(newZone, projectName).then(
      (ManagedZone resp) {
        zones.add(zone);
        zone = resp;
      }
    ).catchError((error) => print(error));
  }
}