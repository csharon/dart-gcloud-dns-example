part of gcloud_dns_lib;

//import 'package:dns_editor/dns/models/resource_record_value.dart';

abstract class ResourceRecordMultiValue extends ResourceRecordValue {
  void parseValue(String val);
}