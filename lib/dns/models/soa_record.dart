part of gcloud_dns_lib;

class SoaRecord extends DnsRecord {

  static const defaultRecord = const {
      'name': '',
      'ttl': 21600,
      'type': 'SOA',
      'rrdatas': const []
  };

  get rrdatas => [rrDataValue.value];

  set rrdatas(List<String> recordList){
    if (recordList.isEmpty){
      rrDataValue = new SoaHostValue();
    } else {
      rrDataValue = new SoaHostValue.fromString(recordList.join(' '));
    }
  }

  SoaHostValue rrDataValue;

  SoaRecord() : super.fromJson(defaultRecord);

  SoaRecord.fromJson(record) : super.fromJson(record);


}