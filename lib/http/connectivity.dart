import 'package:connectivity_plus/connectivity_plus.dart';

Future<void> checkNetworkStatus() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  // 檢查網絡狀態 如果未連接到任何網絡則提示網絡不可用
 if (connectivityResult == ConnectivityResult.none) {
    print('未連接到任何網絡');
  }
}
