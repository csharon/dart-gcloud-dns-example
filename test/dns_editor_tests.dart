library dns_editor.dns_editor_tests;

//import 'package:dns_editor/xd_zone_edit_module.dart';
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_client.dart';
import 'package:dns_editor/dns/models/dns_record.dart';
import 'package:dns_editor/dns/models/soa_record.dart';
import 'package:unittest/unittest.dart';

main() {
  group("DNS Record", (){
    group("Constructors", (){
      test('Default No Arguments', (){
        DnsRecord record = new DnsRecord();
        expect(record.ttl, equals(21600));
      });

      test('fromJson', (){
        var data = {'name': 'test.com.', 'ttl': 86400, 'type': 'A', 'rrdatas': ['1.2.3.4']};

        DnsRecord record = new DnsRecord.fromJson(data);

        expect(record.ttl, equals(86400));
        expect(record.rrdatas[0], equals('1.2.3.4'));
      });

      test('fromRecord', (){
        var data = {'name': 'test.com.', 'ttl': 86400, 'type': 'A', 'rrdatas': ['1.2.3.4']};

        DnsRecord record = new DnsRecord.fromRecord(data);

        expect(record.ttl, equals(86400));
        expect(record.rrdatas[0], equals('1.2.3.4'));
      });

      test('fromRecord with SOA', (){
        var data = {'name': 'test.com.', 'ttl': 86400, 'type': 'SOA', 'rrdatas': ['ns-cloud-d1.googledomains.com. dns-admin.google.com. 2 21600 3600 1209600 300']};

        DnsRecord record = new DnsRecord.fromRecord(data);
        expect(record.serial, equals(2));
        expect(record is SoaRecord, isTrue);
      });

      test('forType', (){
        DnsRecord record = new DnsRecord.forType('SOA');
        expect(record.serial, equals(0));
        expect(record is SoaRecord, isTrue);
        expect(record is ResourceRecordSet, isTrue);

        DnsRecord arecord = new DnsRecord.forType('A');
        expect(arecord.type, equals('A'));
        expect(arecord is DnsRecord, isTrue);
      });
    });

    group("SOA records", (){
      test('fromJson', (){
        var data = {'name': 'test.com.', 'ttl': 86400, 'type': 'SOA', 'rrdatas': ['ns-cloud-d1.googledomains.com. dns-admin.google.com. 2 21600 3600 1209600 300']};

        SoaRecord record = new SoaRecord.fromJson(data);
        expect(record.serial, equals(2));
      });

      test('fromJson with ResourceRecordSet', (){
        var map = {'name': 'test.com.', 'ttl': 86400, 'type': 'SOA', 'rrdatas': ['ns-cloud-d1.googledomains.com. dns-admin.google.com. 2 21600 3600 1209600 300']};
        ResourceRecordSet data = new ResourceRecordSet.fromJson(map);
        SoaRecord record = new SoaRecord.fromJson(data.toJson());
        expect(record.serial, equals(2));
      });

      test('set value', (){
        var data = {'name': 'test.com.', 'ttl': 86400, 'type': 'SOA', 'rrdatas': ['ns-cloud-d1.googledomains.com. dns-admin.google.com. 2 21600 3600 1209600 300']};

        SoaRecord record = new SoaRecord.fromJson(data);
        record.value = 'ns-cloud-d1.googledomains.com. dns-admin.google.com. 3 21600 3600 1209600 300';
        expect(record.serial, equals(3));
      });

      test('set serial', () {
        SoaRecord record = new SoaRecord();
        record.serial = 2014150601;
        expect(record.value, equals('ns email 2014150601 21600 3600 1209600 300'));
      });
    });

  });
}