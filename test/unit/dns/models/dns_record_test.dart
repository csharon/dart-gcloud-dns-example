part of dns_editor_tests;

testDnsRecord() {
  group("DNS Record", () {
    group("Constructors", () {
      test('Default No Arguments', () {
        DnsRecord record = new DnsRecord();
        expect(record.ttl, equals(21600));
      });

      test('fromJson', () {
        var data = {
            'name': 'test.com.', 'ttl': 86400, 'type': 'A', 'rrdatas': ['1.2.3.4']
        };

        DnsRecord record = new DnsRecord.fromJson(data);

        expect(record.ttl, equals(86400));
        expect(record.rrdatas[0], equals('1.2.3.4'));
      });

      test('fromRecord', () {
        var data = {
            'name': 'test.com.', 'ttl': 86400, 'type': 'A', 'rrdatas': ['1.2.3.4']
        };

        DnsRecord record = new DnsRecord.fromRecord(data);

        expect(record.ttl, equals(86400));
        expect(record.rrdatas[0], equals('1.2.3.4'));
      });

      test('fromRecord with SOA', () {
        var data = {
            'name': 'test.com.', 'ttl': 86400, 'type': 'SOA', 'rrdatas': ['ns-cloud-d1.googledomains.com. dns-admin.google.com. 2 21600 3600 1209600 300']
        };

        DnsRecord record = new DnsRecord.fromRecord(data);
        expect(record.rrDataValue.serial, equals(2));
        expect(record is SoaRecord, isTrue);
      });

      test('forType', () {
        DnsRecord record = new DnsRecord.forType('SOA');
        expect(record.rrDataValue.serial, equals(0));
        expect(record is SoaRecord, isTrue);
        expect(record is ResourceRecordSet, isTrue);

        DnsRecord arecord = new DnsRecord.forType('A');
        expect(arecord.type, equals('A'));
        expect(arecord is DnsRecord, isTrue);
      });
    });

    group('value', (){

      test('should be an empty string by default', (){
        var record = new DnsRecord();

        record.rrDataValue.value = '1.2.3.4';
        expect(record.rrdatas[0], equals('1.2.3.4'));
      });

    });

  });
}