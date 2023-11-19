import 'package:flutter/material.dart';
import 'package:hk_transport_flutter/http/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getKmbStopList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('首頁'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            getKmbStopList();
          });
        },
        child: const Icon(Icons.refresh),
      ),
      body: ListView.builder(
        itemCount: kmbStopList['tc']?.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('名稱: ${kmbStopList['tc']![index]['nameTc']!}'),
            subtitle: Text(
                '位置: ${kmbStopList['loclation']![index]['long']} ${kmbStopList['loclation']![index]['lat']}'),
          );
        },
      ),
    );
  }
}
