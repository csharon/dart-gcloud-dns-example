library dns_editor.dns.zone_manager;

import 'package:angular/angular.dart';
import 'dart:async' show Future;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_browser.dart' as dnsclient;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_client.dart';
import 'package:dns_editor/dns/google_cloud_dns.dart';

@Injectable()
class ZoneManager {

  GoogleCloudDns dnsService;

  ZoneManager(this.dnsService);

  List<ManagedZone> zones;
  List<ResourceRecordSet> records;
  String _projectName;
  ManagedZone _zone;

  ManagedZone get zone => _zone;

  void set zone(ManagedZone mz) {
    if (mz != null) {
      listRecords(_projectName, mz.id);
    }
    records = null;
    _zone = mz;
  }

  Future<ManagedZone> loadZones(String name) {
    _projectName = name;
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

  Future<ResourceRecordSet> listRecords(String projectName, String zoneName) {
    return dnsService.dns.resourceRecordSets.list(projectName, zoneName).then(
      (ResourceRecordSetsListResponse resp) {
        records = resp.rrsets;
      }
    ).catchError(
       (error) => print(error)
    );
  }

  Future<Map> deleteZone() {
    return dnsService.dns.managedZones.delete(_projectName, zone.id).then(
        (Map resp) {
          zones.removeWhere((item) => item.id == zone.id);
          zone = null;
        }
    ).catchError(
            (error) => print(error)
    );
  }
}