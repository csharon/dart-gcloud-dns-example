library gcloud_dns_lib_test;

import 'dart:async' show Future;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_client.dart';
import 'package:dns_editor/dns/gcloud_dns_lib.dart';
import 'package:unittest/unittest.dart';

part 'models/rrdata_values_test.dart';
part 'models/dns_record_test.dart';
part 'models/soa_record_test.dart';


main() {

  testDnsRecord();
  testSoaRecord();
  testRRDataValues();

}