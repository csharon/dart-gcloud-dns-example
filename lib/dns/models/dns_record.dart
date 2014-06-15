part of gcloud_dns_lib;

class DnsRecord extends ResourceRecordSet {

  static const defaultRecord = const {
    'name': '',
    'ttl': 21600,
    'type': '',
    'rrdatas': const []
  };

  DnsRecord() : super.fromJson(defaultRecord);

  DnsRecord.fromJson(record) : super.fromJson(record);

  factory DnsRecord.fromRecord(Map record){
    switch(record['type']) {
      case 'SOA':
        return new SoaRecord.fromJson(record);
      default:
        return new DnsRecord.fromJson(record);
    }
  }

  factory DnsRecord.forType(String recordType) {
    switch(recordType) {
      case 'SOA':
        return new SoaRecord();
      default:
        DnsRecord instance = new DnsRecord();
        instance.type = recordType;
        return instance;
    }
  }

  get value {
    if (this.rrdatas == null) return null;
    if (this.rrdatas.isEmpty) {
      this.rrdatas.add('');
    }
    return this.rrdatas[0];
  }
  void set value(val) {
    if (this.rrdatas == null) {
      this.rrdatas = new List<String>();
    }

    if (this.rrdatas.isEmpty) {
      this.rrdatas.add(val);
    } else {
      this.rrdatas[0] = val;
    }
  }

}