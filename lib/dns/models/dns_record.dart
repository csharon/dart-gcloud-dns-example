library dns_editor.dns.models.dns_record;

import 'dart:async' show Future;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_client.dart';
import 'package:dns_editor/dns/models/soa_record.dart';

class DnsRecord extends ResourceRecordSet {

  static const defaultRecord = const {
    'name': '',
    'ttl': 21600,
    'type': '',
    'rrdatas': const []
  };

  DnsRecord() : super.fromJson(defaultRecord);

  DnsRecord.fromJson(record) : super.fromJson(record);

  factory DnsRecord.fromRecord(Map record){
    switch(record['type']) {
      case 'SOA':
        return new SoaRecord.fromJson(record);
      default:
        return new DnsRecord.fromJson(record);
    }
  }

  factory DnsRecord.forType(String recordType) {
    switch(recordType) {
      case 'SOA':
        return new SoaRecord();
      default:
        DnsRecord instance = new DnsRecord();
        instance.type = recordType;
        return instance;
    }
  }

}