import 'package:dio/dio.dart';
import 'package:hk_transport_flutter/http/api.dart';
import 'package:hk_transport_flutter/http/constants.dart';

Dio dio = Dio();

List<String> routeList = [];

void getKmbRouteList() async {
  try {
    // 发送 HTTP 请求并获取响应
    Response response = await dio.get(HttpUrl.baseUrl + Api.kmbRouteList);

    // 解析 JSON 数据
    final data = response.data;
    if (data is Map<String, dynamic> && data.containsKey('data')) {
      List<dynamic> routeData = data['data'];
      for (var route in routeData) {
        String origTc = route['orig_tc'];
        String destTc = route['dest_tc'];
        String routeInfo = '$origTc -> $destTc';
        print(routeInfo);
        routeList.add(routeInfo);
      }
    }
  } catch (error) {
    // 处理错误
    print('Error: $error');
  }
}

//void getKMBStopList()async{
//  try{
//    Response response = await dio.get(HttpUrl.baseUrl + Api.kmbStopList);
//    final data =response.data;
//      if (data is Map<String, dynamic> && data.containsKey('data')) {
//      List<dynamic> stopData = data['data'];
//      for (var stop in stopData) {
//      }
//      }
//  }
//}