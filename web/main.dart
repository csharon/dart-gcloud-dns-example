library xdZoneEdit.main;

import 'package:angular/angular.dart';
//import 'package:angular/application_factory.dart';
import 'package:xdZoneEdit/xd_zone_edit_module.dart';
//import 'package:xdZoneEdit/oauth/google_oauth2_module.dart';
@MirrorsUsed(override: '*')
import 'dart:mirrors';

main() {
  ngBootstrap(module: new XDZoneEditModule());

}