import 'package:flutter/material.dart';
import 'package:git_mentalhealth/pages/spash/domain/preload_service.dart';

class PreloadServices {
  static BuildContext? _context;

  static void init(BuildContext context) {
    _context = context;
  }

  static final Map<dynamic, dynamic> preloadServices = {
    //list of all preload services
  };

  static void callPreLoadServices(List<PreLoadConfig> listPreLoadConfig) {
    for (PreLoadConfig element in listPreLoadConfig) {
      if ((element.preLoad)!) {
        preloadServices[element.name]();
      }
    }
  }
}
