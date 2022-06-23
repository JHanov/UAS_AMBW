import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uas_1/apiservices.dart';
import 'package:uas_1/dataclass.dart';
import 'package:uas_1/detail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
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
                      title: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                      dpTitle: Posts[index].title,
                                      dpDescription: Posts[index].description,
                                      pubDate: Posts[index]
                                          .pubDate
                                          .toIso8601String(),
                                      thumbnail: Posts[index].thumbnail)));
                        },
                        child: Card(
                          elevation: 10,
                          child: Container(
                            margin: EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Image.network(
                                  Posts[index].thumbnail,
                                  width: 100,
                                  height: 100,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                    child: Text(
                                  Posts[index].title,
                                  style: TextStyle(fontSize: 12),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
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
