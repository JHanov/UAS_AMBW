import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uas_1/dbclass.dart';

CollectionReference tblLiked = FirebaseFirestore.instance.collection("Liked");

class Liked {
  static Stream<QuerySnapshot> getData(String text) {
    return tblLiked.snapshots();
  }

  static Future<void> tambahData({required itemPost item}) async {
    DocumentReference docRef = tblLiked.doc(item.itemTitle);

    await docRef.set(item.toJson()).catchError((e) => print(e.hashCode));
  }

  static Future<void> deleteData({required itemPost item}) async {
    DocumentReference docRef = tblLiked.doc(item.itemTitle);

    await docRef.delete();
  }
}
