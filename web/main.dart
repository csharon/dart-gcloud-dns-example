library xdZoneEdit.main;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:xdZoneEdit/xd_zone_edit_module.dart';

main() {
  applicationFactory()
    .addModule(new XDZoneEditModule())
    .run();
}