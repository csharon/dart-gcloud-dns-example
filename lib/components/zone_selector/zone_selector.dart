library xdZoneEdit.components.zone_selector.zone_selector;

import 'package:angular/angular.dart';
import 'dart:async' show Future;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_client.dart';
import 'package:xdZoneEdit/oauth/google_oauth2_service.dart';
import 'package:xdZoneEdit/dns/google_cloud_dns.dart';
import 'package:xdZoneEdit/dns/project_manager.dart';
import 'package:xdZoneEdit/dns/zone_manager.dart';
import 'package:bootjack/bootjack.dart';

@Component(
    selector: 'zone-selector',
    templateUrl: 'packages/xdZoneEdit/components/zone_selector/zone_selector.html',
    cssUrl: 'packages/xdZoneEdit/components/zone_selector/zone_selector.css',
    publishAs: 'zoneSelector',
    useShadowDom: false
)
class ZoneSelector {

  GoogleOauth2Service gas;
  GoogleCloudDns dnsClient;
  ProjectManager pm;
  @NgTwoWay('project-name')
  String projectName;
  ZoneManager zm;

  String get selectedZoneName {
    if (zm.zone == null) {
      return 'Select Zone';
    } else {
      return zm.zone.dnsName;
    }
  }

  List<ManagedZone> get zones => zm.zones;
  ManagedZone get selectedZone => zm.zone;

  List<Project> get projects => pm.projects;

  bool get isAuthenticated {
    if(gas.isAuthenticated) {
      dnsClient.createDnsClient();
    }
    return gas.isAuthenticated;
  }

  ZoneSelector(GoogleOauth2Service this.gas, GoogleCloudDns this.dnsClient, ZoneManager this.zm, ProjectManager this.pm) {
    Dropdown.use();
    Modal.use();
    Transition.use();
  }

  void loadZones() {
    Future.wait([pm.loadProject(projectName), zm.loadZones(projectName)])
      .then((List responses) {
        print("Project and Zones loaded.");
      })
      .catchError((error) => print(error));

  }

  void selectZone(ManagedZone zone) {
    zm.zone = zone;
  }

  void selectProject(Project project) {
    pm.project = project;
    projectName = pm.project.id;
  }

}