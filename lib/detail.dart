import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        title: Text(''),
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
          Text("${widget.dpDescription}")
        ]),
      ),
    );
  }
}
