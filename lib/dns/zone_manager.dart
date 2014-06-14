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
  String projectName;
  ManagedZone _zone;
  bool loadingZones = false;
  bool loadingRecords = false;
  bool creatingZone = false;
  bool deletingZone = false;

  ManagedZone get zone => _zone;

  void set zone(ManagedZone mz) {
    if (mz != null) {
      listRecords(projectName, mz.id);
    }
    records = null;
    _zone = mz;
  }

  Future<ManagedZone> loadZones(String name) {
    loadingZones = true;
    projectName = name;
    return dnsService.dns.managedZones.list(name).then(
      (ManagedZonesListResponse resp) {
        zones = resp.managedZones;
        loadingZones = false;
      }
    ).catchError((error){
      print(error);
      loadingZones = false;
    });
  }

  Future<ManagedZone> create(String projectName, Map item) {
    creatingZone = true;
    ManagedZone newZone = new ManagedZone.fromJson(item);
    return dnsService.dns.managedZones.create(newZone, projectName).then(
      (ManagedZone resp) {
        zones.add(zone);
        zone = resp;
        creatingZone = false;
      }
    ).catchError((error){
      print(error);
      creatingZone = false;
    });
  }

  Future<ResourceRecordSet> listRecords(String project, String zoneName) {
    loadingRecords = true;
    return dnsService.dns.resourceRecordSets.list(project, zoneName).then(
      (ResourceRecordSetsListResponse resp) {
        records = resp.rrsets;
        loadingRecords = false;
      }
    ).catchError(
       (error){
         print(error);
         loadingRecords = false;
       }
    );
  }

  Future<Map> deleteZone() {
    deletingZone = true;
    return dnsService.dns.managedZones.delete(projectName, zone.id).then(
        (Map resp) {
          zones.removeWhere((item) => item.id == zone.id);
          zone = null;
          deletingZone = false;
        }
    ).catchError(
       (error){
         print(error);
         deletingZone = false;
       }
    );
  }
}