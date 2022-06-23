import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uas_1/dbservices.dart';

class LikedPage extends StatefulWidget {
  const LikedPage({Key? key}) : super(key: key);

  @override
  State<LikedPage> createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {
  final _searchText = TextEditingController();
  Stream<QuerySnapshot<Object?>> onSearch() {
    setState(() {});
    return Liked.getData(_searchText.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: StreamBuilder<QuerySnapshot>(
        stream: onSearch(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("error");
          } else if (snapshot.hasData || snapshot.data != null) {
            return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                      height: 8,
                    ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot dsData = snapshot.data!.docs[index];
                  String lvTitle = dsData['Title'];
                  String lvThumbnail = dsData['Thumbnail'];
                  return ListTile(
                    title: Card(
                      child: Row(
                        children: [
                          // Image.network(
                          //   '${lvThumbnail.toString()}',
                          //   height: 50,
                          //   width: 50,
                          // ),
                          Expanded(child: Text(lvTitle))
                        ],
                      ),
                    ),
                  );
                });
          }
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
            ),
          );
        },
      ),
    );
  }
}
