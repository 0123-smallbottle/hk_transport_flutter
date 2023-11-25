import 'package:dio/dio.dart';
import 'package:hk_transport_flutter/http/api.dart';
import 'package:hk_transport_flutter/http/constants.dart';

Dio dio = Dio();

Map<String, List<Map<String, String>>> kmbRouteList = {
  'route': [], // 路綫代碼
  // 繁體中文
  'origTc': [], // 首站
  'destTc': [], // 尾站

  // 簡體中文
  'origSc': [], // 首站
  'destSc': [], // 尾站

  // 英文
  'origEn': [], // 首站
  'destEn': [], // 尾站

  'serviceType': [], // 服務類型(暫時未知道作用)
};
Future <void> getKmbRouteList() async {
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
        String origTc = data['orig_tc']; //首站
        String destTc = data['dest_tc']; //尾站
        // 簡體中文
        String origSc = data['orig_sc']; //首站
        String destSc = data['dest_sc']; //尾站
        // 英文
        String origEn = data['orig_en']; //首站
        String destEn = data['dest_en']; //尾站

        String serviceType = data['service_type']; //服務類型(暫時未知道作用)

        // 將路綫列表添加到List中
        // 路綫代碼
        kmbRouteList['route']?.add({'route': route});

        // 繁體中文
        // 首站
        kmbRouteList['origTc']?.add({
          'origTc': origTc,
        });
        // 尾站
        kmbRouteList['destTc']?.add({
          'destTc': destTc,
        });
        // 簡體中文
        // 首站
        kmbRouteList['origSc']?.add({
          'origSc': origSc,
        });
        // 尾站
        kmbRouteList['destSc']?.add({
          'destSc': destSc,
        });
        // 英文
        // 首站
        kmbRouteList['origEn']?.add({
          'origEn': origEn,
        });
        // 尾站
        kmbRouteList['destEn']?.add({
          'destEn': destEn,
        });

        // 服務類型(暫時未知道作用)
        kmbRouteList['serviceType']?.add({
          'serviceType': serviceType,
        });
      }
    }
  } catch (error) {
    // 处理错误
    print('錯誤: $error');
  }
}

// 巴士站列表
Map<String, List<Map<String, String>>> kmbStopList = {
  'stopId': [], // 巴士站ID
  'tc': [], // 繁體中文
  'sc': [], // 簡體中文
  'en': [], // 英文
  'loclation': [], // 位置
};

Future <void> getKmbStopList() async {
  try {
    // 獲取巴士站列表
    Response response = await dio.get(HttpUrl.baseUrl + Api.kmbStopList);

    // 解析數據
    final data = response.data;
    if (data is Map<String, dynamic> && data.containsKey('data')) {
      List<dynamic> responseData = data['data'];
      for (var data in responseData) {
        //巴士站ID
        String stopId = data['stop'];

        // 站名
        String nameTc = data['name_tc']; // 繁體中文
        String nameSc = data['name_sc']; // 簡體中文
        String nameEn = data['name_en']; // 英文

        // 位置
        String long = data['long']; // 經度
        String lat = data['lat']; // 緯度

        // 將巴士站列表添加到List中
        // 巴士站ID
        kmbStopList['stopId']?.add({'stopId': stopId});
        // 繁體中文
        kmbStopList['tc']?.add({
          'nameTc': nameTc,
        });
        // 簡體中文
        kmbStopList['sc']?.add({
          'nameSc': nameSc,
        });
        // 英文
        kmbStopList['en']?.add({
          'nameEn': nameEn,
        });

        // 位置
        kmbStopList['loclation']?.add({
          'long': long, // 經度
          'lat': lat, // 緯度
        });
      }
    }
  } catch (error) {
    // 处理错误
    print('错误: $error');
  }
}

Map<String, List<Map<String, String>>> kmbStopETA = {};
// 巴士站到站時間
Future <void> getKmbStopETA(String stopId, route, servicetype) async {
  try {
    // 獲取站列表
    Response response =
        await dio.get(HttpUrl.baseUrl + Api.kmbStopETA + stopId);

    // 解析數據
    final data = response.data;
    if (data is Map<String, dynamic> && data.containsKey('data')) {
      List<dynamic> responseData = data['data'];
      for (var data in responseData) {
        // 尾站
        String dest_tc = data['dest_tc']; // 繁體中文
        String dest_sc = data['dest_sc']; // 簡體中文
        String dest_en = data['dest_en']; // 英文

        // 到站時間
        String eta = data['eta'];

        // 到站時間項數
        String seq = data['eta_seq'];

        // 方向
        String bond = data['Bond'];
      }
    }
  } catch (error) {
    // 处理错误
    print('錯誤: $error');
  }
}
