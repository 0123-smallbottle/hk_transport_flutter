import 'package:dio/dio.dart';
import 'package:hk_transport_flutter/http/api.dart';
import 'package:hk_transport_flutter/http/constants.dart';

Dio dio = Dio();

List<String> routeList = [];
// 巴士路線列表
void getKmbRouteList() async {
  // 創建一個Map來儲存各種語言的巴士路綫
  Map<String, Map<String, String>> routeMap = {};
  try {
    // 獲取路綫列表
    Response response = await dio.get(HttpUrl.baseUrl + Api.kmbRouteList);

    // 解析數據
    final data = response.data;
    if (data is Map<String, dynamic> && data.containsKey('data')) {
      List<dynamic> responseData = data['data'];
      for (var data in responseData) {
        // 路綫代碼
        String route = data['route'];

        // 繁體中文
        String origTc = data['orig_tc'];
        String destTc = data['dest_tc'];

        // 簡體中文
        String origSc = data['orig_sc'];
        String destSc = data['dest_sc'];

        // 英文
        String origEn = data['orig_en'];
        String destEn = data['dest_en'];

        //服務類型(暫時未知道作用)
        String serviceType = data['service_type'];

        // 將路綫添加到Map中
        routeMap['tc'] = {'orig': origTc, 'dest': destTc};
        routeMap['sc'] = {'orig': origSc, 'dest': destSc};
        routeMap['en'] = {'orig': origEn, 'dest': destEn};
        routeMap['route'] = {'route': route};
        // 將路綫添加到routeList中
        routeList.add(
            '$route : ${routeMap['tc']?['orig']} -> ${routeMap['tc']?['dest']}');
      }
    }
  } catch (error) {
    // 处理错误
    print('錯誤: $error');
  }
}

List<String> stopList = [];

// 巴士站列表
void getKmbStopList() async {
  Map<String, Map<String, String>> stopMap = {};
  try {
    // 獲取站列表
    Response response = await dio.get(HttpUrl.baseUrl + Api.kmbStopList);

    // 解析數據
    final data = response.data;
    if (data is Map<String, dynamic> && data.containsKey('data')) {
      List<dynamic> responseData = data['data'];
      for (var data in responseData) {
        // 站名
        // 繁體中文
        String nameTc = data['name_tc'];

        // 簡體中文
        String nameSc = data['name_sc'];

        // 英文
        String nameEn = data['name_en'];


        // 獲取位置
        // 經度
        String long = data['long'];

        // 緯度
        String lat = data['lat'];
        

        
        // 將巴士站添加到Map中
        stopMap['name_tc'] = {'name': nameTc};
        stopMap['name_sc'] = {'name': nameSc};
        stopMap['name_en'] = {'name': nameEn};
        stopMap['location'] = {'long': long, 'lat': lat};

        // 將巴士站添加到stopList中
         stopList.add('$nameTc 位置: $long, $lat');

      }
    }
  } catch (error) {
    // 处理错误
    print('錯誤: $error');
  }
}