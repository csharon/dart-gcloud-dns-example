library dns_editor.dns.project_manager;

import 'package:angular/angular.dart';
import 'dart:async' show Future;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_browser.dart' as dnsclient;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_client.dart';
import 'package:dns_editor/local_storage/local_storage_service.dart';
import 'package:dns_editor/dns/google_cloud_dns.dart';

@Injectable()
class ProjectManager {

  GoogleCloudDns dnsService;
  LocalStorageService localStore;
  static const PROJECT_KEY = 'projects';

  ProjectManager(this.dnsService, this.localStore) {
   loadProjects();
  }

  List<Project> _projects;

  List<Project> get projects {
    if (_projects == null) {

    } else {
      return _projects;
    }
  }

  Project _project;
  Project get project => _project;
  void set project(Project proj) {
    _project = proj;

  }

  Future<Project> getProjectFromName(String name) {
    return dnsService.dns.projects.get(name).then(
      (Project resp) {
        project = resp;
        Project existing = _projects.firstWhere((item) => item.id == resp.id, orElse: () => null);
        if (existing != null) {
          _projects.removeWhere((item) => item.id == existing.id);
        }
        _projects.add(resp);
        localStore.save(PROJECT_KEY, _projects);
      }
    ).catchError((error) => print(error));
  }

  void loadProjects() {
    _projects = new List<Project>();
    Map _localStore = localStore.get(PROJECT_KEY);
    if (_localStore != null) {
      _localStore.forEach((proj) {
        var p = new Project.fromJson(proj);
        Project existing = _projects.firstWhere((item) => item.id == p.id, orElse: () => null);
        if (existing == null) {

          _projects.add(p);
        }

      });
    }
  }

}