import 'package:flutter/material.dart';
import 'package:hk_transport_flutter/http/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('首頁'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {stopList;});
          setState(() {getKmbStopList();});
        },
        child: const Icon(Icons.refresh),
      ),
      body: ListView.builder(
        itemCount: stopList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(stopList[index]),
          );
        },
      ),
    );
  }
}
