library dns_editor.main;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:dns_editor/xd_zone_edit_module.dart';

main() {
  applicationFactory()
    .addModule(new XDZoneEditModule())
    .run();
}