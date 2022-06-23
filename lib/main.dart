import 'package:flutter/material.dart';
import 'package:uas_1/apiservices.dart';
import 'package:uas_1/dataclass.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  apiService serviceAPI = apiService();
  late Future<Welcome> listData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listData = serviceAPI.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Container(
        child: FutureBuilder<Welcome>(
            future: listData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Welcome isiData = snapshot.data!;
                List<Post> Posts = isiData.data.posts;
                return ListView.builder(
                  itemCount: Posts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(Posts[index].title),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}
