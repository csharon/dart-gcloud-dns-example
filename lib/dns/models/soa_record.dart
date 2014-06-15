part of gcloud_dns_lib;

class SoaRecord extends DnsRecord {

  static const Map<int,String> FIELD_POSITIONS = const {
    0: "nameServer",
    1: "email",
    2: "serial",
    3: "refreshRate",
    4: "updateRetry",
    5: "expiry",
    6: "minCache"
  };

  static const defaultRecord = const {
      'name': '',
      'ttl': 21600,
      'type': 'SOA',
      'rrdatas': const []
  };

  int _serial = 0;
  int get serial => _serial;
  void set serial(int val) {
    _serial = val;
    updateRRDatas();
  }

  String _nameServer = 'ns';
  String get nameServer => _nameServer;
  String set nameServer(String ns){
    _nameServer = ns;
    updateRRDatas();
  }

  String _email = 'email';
  String get email => _email;
  String set email(String val){
    _email = val;
    updateRRDatas();
  }

  int _refreshRate = 21600;
  int get refreshRate => _refreshRate;
  void set refreshRate(int val) {
    _refreshRate = val;
    updateRRDatas();
  }

  int _updateRetry = 3600;
  int get updateRetry => _updateRetry;
  void set updateRetry(int val) {
    _updateRetry = val;
    updateRRDatas();
  }

  int _expiry = 1209600;
  int get expiry => _expiry;
  void set expiry(int val) {
    _expiry = val;
    updateRRDatas();
  }

  int _minCache = 300;
  int get minCache => _minCache;
  void set minCache(int val) {
    _minCache = val;
    updateRRDatas();
  }

  override set value(val) {
    if (this.rrdatas == null) {
      this.rrdatas = new List<String>();
    }

    if (this.rrdatas.isEmpty) {
      this.rrdatas.add(val);
    } else {
      this.rrdatas[0] = val;
    }
    setRRDatas(val);
  }

  SoaRecord() : super.fromJson(defaultRecord);

  SoaRecord.fromJson(record) : super.fromJson(record) {
    setRRDatas(this.value);
  }

  void setRRDatas(val) {
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

  void updateRRDatas() {
    if (rrdatas == null) {
      rrdatas = new List<String>();
    }
    if (rrdatas.isEmpty) {
      rrdatas.add(serializeRRDatas());
    } else {
      rrdatas[0] = serializeRRDatas();
    }
  }

  String serializeRRDatas() {
    return '${nameServer} ${email} ${serial.toString()} ${refreshRate.toString()} ${updateRetry.toString()} ${expiry.toString()} ${minCache.toString()}';
  }

}
/*
List<String> rrdata = soa.rrdatas[0].split(' ');
    var serial = int.parse(rrdata[2]) + 1;
    rrdata[2] = serial.toString();
    newSoa.rrdatas[0] = rrdata.join(' ');

 */