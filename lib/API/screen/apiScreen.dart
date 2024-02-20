import 'package:flutter/material.dart';
import 'package:practice/API/apiService/apiService.dart';
import 'package:practice/API/model/model.dart';

class fecthData extends StatefulWidget {
  const fecthData({super.key});

  @override
  State<fecthData> createState() => _fecthDataState();
}

class _fecthDataState extends State<fecthData> {
  final allServices apiService = allServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Data"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: apiService.getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              print("Connection State: Active");
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              print("Error ${snapshot.error}");
            } else if (snapshot.hasData) {
              final List<model> getdata = snapshot.data as List<model>;
              return ListView.builder(
                  itemCount: getdata.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          Text("ID ${getdata[index].id}"),
                          Text(
                            "Title ${getdata[index].title}",
                            textAlign: TextAlign.center,
                          ),
                          Text('${getdata[index].userid}'),
                        ],
                      ),
                    );
                  });
            }
            return const SizedBox.shrink();
          }),
    );
  }
}
