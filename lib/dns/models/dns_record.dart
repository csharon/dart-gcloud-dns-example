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


  get rrdatas => [rrDataValue.value];

  set rrdatas(List<String> recordList){
    if (recordList == null){
      rrDataValue = new RRDataValue();
    } else {
      rrDataValue = new RRDataValue.fromString(recordList.join(' '));
    }
  }

  RRDataValue rrDataValue;

}