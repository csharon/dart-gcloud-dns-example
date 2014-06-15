part of dns_editor_tests;

testSoaRecord() {
  group("SoaRecord", () {

    group('Constructors', (){

      test('fromJson', () {
        var data = {
            'name': 'test.com.', 'ttl': 86400, 'type': 'SOA', 'rrdatas': ['ns-cloud-d1.googledomains.com. dns-admin.google.com. 2 21600 3600 1209600 300']
        };

        SoaRecord record = new SoaRecord.fromJson(data);
        expect(record.rrDataValue.serial, equals(2));
      });

      test('fromJson with ResourceRecordSet', () {
        var map = {
            'name': 'test.com.', 'ttl': 86400, 'type': 'SOA', 'rrdatas': ['ns-cloud-d1.googledomains.com. dns-admin.google.com. 2 21600 3600 1209600 300']
        };
        ResourceRecordSet data = new ResourceRecordSet.fromJson(map);
        SoaRecord record = new SoaRecord.fromJson(data.toJson());
        expect(record.rrDataValue.serial, equals(2));
      });

    });

    group('Fields', (){

      test('set value', () {
        var data = {
            'name': 'test.com.', 'ttl': 86400, 'type': 'SOA', 'rrdatas': ['ns-cloud-d1.googledomains.com. dns-admin.google.com. 2 21600 3600 1209600 300']
        };

        SoaRecord record = new SoaRecord.fromJson(data);
        record.rrdatas = ['ns-cloud-d1.googledomains.com. dns-admin.google.com. 3 21600 3600 1209600 300'];
        expect(record.rrDataValue.serial, equals(3));
      });

      test('set serial', () {
        SoaRecord record = new SoaRecord();
        record.rrDataValue.serial = 2014150601;
        expect(record.rrdatas[0], equals('NAMESERVER ADMIN 2014150601 21600 3600 1209600 300'));
      });

    });

  });
}