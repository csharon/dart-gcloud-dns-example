part of gcloud_dns_lib;

class MxHostValue implements ResourceRecordMultiValue {

  int priority = 0;
  String mailServer = 'mail server';

  String get value => '${priority} ${mailServer}';
  void set value(String val) => parseValue(val);

  void parseValue(String val) {
    List<String> data = val.split(' ');
    priority = int.parse(data[0]);
    mailServer = data[1];
  }
}