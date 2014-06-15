part of gcloud_dns_lib;

class MxHostValue extends RRDataValue implements ResourceRecordMultiValue {

  int priority = 0;
  String mailServer = 'mail server';

  String get value => '${priority} ${mailServer}';
  override set value(String val) => parseValue(val);

  MxHostValue();

  MxHostValue.fromString(String recordValue) => super.fromString(recordValue);

  void parseValue(String val) {
    List<String> data = val.split(' ');
    priority = int.parse(data[0]);
    mailServer = data[1];
  }
}