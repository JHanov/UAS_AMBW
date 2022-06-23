import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uas_1/dbclass.dart';
import 'package:uas_1/dbservices.dart';
import 'package:uas_1/likedpage.dart';

class DetailPage extends StatefulWidget {
  final String dpTitle;
  final String dpDescription;
  final String pubDate;
  final String thumbnail;
  const DetailPage(
      {Key? key,
      required this.dpTitle,
      required this.dpDescription,
      required this.pubDate,
      required this.thumbnail})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(children: [
          Image.network("${widget.thumbnail}"),
          SizedBox(
            height: 8,
          ),
          Text(
            "${widget.dpTitle}",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text("${widget.pubDate}"),
          SizedBox(
            height: 8,
          ),
          Text("${widget.dpDescription}"),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    final dtBaru = itemPost(
                        itemTitle: widget.dpTitle.toString(),
                        itemDescription: widget.dpDescription.toString(),
                        itemPubDate: widget.pubDate.toString(),
                        itemThumbnail: widget.thumbnail.toString());
                    Liked.tambahData(item: dtBaru);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LikedPage()));
                  },
                  child: Icon(Icons.thumb_up)),
              SizedBox(
                width: 16,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final dtBaru = itemPost(
                        itemTitle: widget.dpTitle.toString(),
                        itemDescription: widget.dpDescription.toString(),
                        itemPubDate: widget.pubDate.toString(),
                        itemThumbnail: widget.thumbnail.toString());
                    Liked.deleteData(item: dtBaru);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LikedPage()));
                  },
                  child: Icon(Icons.thumb_down))
            ],
          )
        ]),
      ),
    );
  }
}
