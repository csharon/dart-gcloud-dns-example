part of gcloud_dns_editor_tests;

testRRDataValues() {

  group('MxHostValue', () {
    MxHostValue host;

    setUp(() => host = new MxHostValue());

    test('should implement ResourceRecordMultiValue', () {
      expect(host.value, new isInstanceOf<String>());

    });

    test('should have a priority property', (){
      expect(host.priority, new isInstanceOf<int>());
    });

    test('should have a mailServer property', () {
      expect(host.mailServer, new isInstanceOf<String>());
    });

    test('value should be equal to the priority and mailServer separated by a space', (){
      expect(host.value, equals('0 mail server'));
    });

    test('setting value should parse input value and set priority and mailServer', (){
      host.value = '10 mx.test.com';
      expect(host.value, equals('10 mx.test.com'));
    });
  });

  group('SoaHostValue', () {
    SoaHostValue host;

    group('constructors', (){
      setUp(() => host = new SoaHostValue.fromString('ns-cloud-d1.googledomains.com. dns-admin.google.com. 2 21600 3600 1209600 300'));
      test('fromString', (){
        expect(host.serial, equals(2));
        expect(host.email, equals('dns-admin.google.com.'));
      });
    });

    setUp(() => host = new SoaHostValue());

    test('should implement ResourceRecordMultiValue', () {
      expect(host.value, new isInstanceOf<String>());
      expect(host, new isInstanceOf<ResourceRecordMultiValue>());
      expect(host, new isInstanceOf<ResourceRecordValue>());
      expect(host, new isInstanceOf<SoaHostValue>());
    });

    test('should properly set values', (){
      host.value = 'ns-cloud-d1.googledomains.com. dns-admin.google.com. 2 21600 3600 1209600 300';
      expect(host.value, equals('ns-cloud-d1.googledomains.com. dns-admin.google.com. 2 21600 3600 1209600 300'));
      expect(host.serial, equals(2));
      expect(host.email, equals('dns-admin.google.com.'));

      host.serial = 3;
      expect(host.value, equals('ns-cloud-d1.googledomains.com. dns-admin.google.com. 3 21600 3600 1209600 300'));
    });

  });

}