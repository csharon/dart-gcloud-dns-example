library dns_editor.components.resource_record_form;

import 'package:angular/angular.dart';
import 'dart:async' show Future;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_client.dart';
import 'package:dns_editor/dns/change_manager.dart';
import 'package:dquery/dquery.dart';
import 'package:bootjack/bootjack.dart';

@Component(
    selector: 'resource-record-form',
    templateUrl: 'packages/dns_editor/components/resource_record_form/resource_record_form.html',
    cssUrl: 'packages/dns_editor/components/resource_record_form/resource_record_form.css',
    publishAs: 'ctrl',
    useShadowDom: false
)
class ResourceRecordForm {

  ResourceRecordSet original;
  ResourceRecordSet record;
  ChangeManager changeManager;
  String rrdataVal = '';

  ResourceRecordForm(this.changeManager) {
    resetForm();
    Modal.use();
    Alert.use();
    Transition.use();
  }

  void addRecord() {
    record.rrdatas = new List<String>();
    record.rrdatas.add(rrdataVal);
    changeManager.createChangeSet();
    changeManager.add(record);
    changeManager.saveChanges();
  }

  void resetForm() {
    record = new ResourceRecordSet.fromJson({});

  }

}
