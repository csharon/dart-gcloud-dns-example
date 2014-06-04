library xdZoneEdit.dns.project_manager;

import 'package:angular/angular.dart';
import 'dart:async' show Future;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_browser.dart' as dnsclient;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_client.dart';
import 'package:xdZoneEdit/local_storage/local_storage_service.dart';
import 'package:xdZoneEdit/dns/google_cloud_dns.dart';

@Injectable()
class ProjectManager {

  GoogleCloudDns dnsService;
  LocalStorageService localStore;
  static const PROJECT_KEY = 'projects';

  ProjectManager(this.dnsService, this.localStore);

  List<Project> _projects;

  List<Project> get projects {
    if (_projects == null) {
      _projects = localStore.get(PROJECT_KEY);
    } else {
      return _projects;
    }
  }

  Project _project;
  Project get project => _project;
  void set project(Project proj) {
    _project = proj;
    if (projects == null) {
      _projects = new List<Project>();
      _projects.add(_project);
      localStore.save(PROJECT_KEY, _projects);
    } else {
      if (!_projects.contains(_project)) {
        _projects.add(_project);
        localStore.save(PROJECT_KEY, _projects);
      }
    }
  }

  Future<Project> loadProject(String name) {
    return dnsService.dns.projects.get(name).then(
      (Project resp) {
        project = resp;
      }
    ).catchError((error) => print(error));
  }

}