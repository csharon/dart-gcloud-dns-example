part of gcloud_dns_lib;

class SoaHostValue extends RRDataValue implements ResourceRecordMultiValue {

  String nameServer = 'NAMESERVER';
  String email = 'ADMIN';
  int serial = 0;
  int refreshRate = 21600;
  int updateRetry = 3600;
  int expiry = 1209600;
  int minCache = 300;


  String get value => '${nameServer} ${email} ${serial.toString()} ${refreshRate.toString()} '
  + '${updateRetry.toString()} ${expiry.toString()} ${minCache.toString()}';
  override set value(String val) => parseValue(val);

  SoaHostValue();

  SoaHostValue.fromString(recordValue) : super.fromString(recordValue);

  void parseValue(String val) {
    List<String> rrdata = val.split(' ');
    int i;
    for (i = 0; i < rrdata.length; i++) {
      switch (i) {
        case 0:
          this.nameServer = rrdata[i];
          break;
        case 1:
          this.email = rrdata[i];
          break;
        case 2:
          this.serial = int.parse(rrdata[i]);
          break;
        case 3:
          this.refreshRate = int.parse(rrdata[i]);
          break;
        case 4:
          this.updateRetry = int.parse(rrdata[i]);
          break;
        case 5:
          this.expiry = int.parse(rrdata[i]);
          break;
        case 6:
          this.minCache = int.parse(rrdata[i]);
          break;
      }
    }
  }
}