library dns_editor.dns.change_manager;

import 'package:angular/angular.dart';
import 'dart:async' show Future;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_browser.dart' as dnsclient;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_client.dart';
import 'package:dns_editor/dns/google_cloud_dns.dart';
import 'package:dns_editor/dns/zone_manager.dart';
import 'package:dns_editor/dns/models/dns_record.dart';
import 'package:dns_editor/dns/models/soa_record.dart';

@Injectable()
class ChangeManager {

  GoogleCloudDns dnsService;
  ZoneManager zm;

  Change changeSet;

  ChangeManager(this.dnsService, this.zm) {
    resetChanges();
  }

  void createChangeSet() {
    DnsRecord soa = new DnsRecord.fromRecord(zm.records.firstWhere((item) => item.type == 'SOA').toJson());
    DnsRecord newSoa = new DnsRecord.fromRecord(soa.toJson());
    newSoa.serial++;
    changeSet.additions = new List<ResourceRecordSet>();
    changeSet.deletions = new List<ResourceRecordSet>();
    changeSet.deletions.add(soa);
    changeSet.additions.add(newSoa);
  }

  Future<Change> saveChanges() {
    return dnsService.dns.changes.create(changeSet, zm.projectName, zm.zone.id).then(
        (ChangesListResponse resp) {
          print(resp);
          zm.listRecords(zm.projectName, zm.zone.id);
        }
    ).catchError(
            (error) => print(error)
    );
  }

  void resetChanges() => changeSet = new Change.fromJson({});

  void add(ResourceRecordSet record, {String toList: 'additions'}) {
    if (toList == 'additions')
      changeSet.additions.add(record);
    else
      changeSet.deletions.add(record);
  }

  void remove(ResourceRecordSet record, {String fromList: 'additions'}) {
    if (toList == 'additions')
      changeSet.additions.remove(record);
    else
      changeSet.deletions.remove(record);
  }


}