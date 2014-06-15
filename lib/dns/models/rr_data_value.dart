part of gcloud_dns_lib;

class RRDataValue implements ResourceRecordValue {

  String _value;

  String get value => _value;

  set value(String value) => _value = value;

  RRDataValue();

  RRDataValue.fromString(recordValue) {
    this.value = recordValue;
  }


}