library xdZoneEdit.main;

import 'package:angular/angular.dart';
import 'package:xdZoneEdit/xd_zone_edit_module.dart';


@MirrorsUsed(override: '*')
import 'dart:mirrors';

main() {
  ngBootstrap(module: new XDZoneEditModule());

}