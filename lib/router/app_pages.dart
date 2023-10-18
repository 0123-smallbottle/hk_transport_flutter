import 'package:get/get.dart';
import 'package:hk_transport_flutter/pages/home/index.dart';
import 'package:hk_transport_flutter/pages/search/index.dart';
import 'package:hk_transport_flutter/pages/settings/index.dart';

class Routes {
  static final List<GetPage> getPages = [
    GetPage(name:'/home', page: () => const HomePage()),
    GetPage(name:'/search', page: () => const SearchPage()),
    GetPage(name:'/settings', page: () => const SettingsPage()),
      ];

  Routes(HomePage homePage);
    
}