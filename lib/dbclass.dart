class itemPost {
  final String itemTitle;
  final String itemDescription;
  final String itemPubDate;
  final String itemThumbnail;

  itemPost(
      {required this.itemTitle,
      required this.itemDescription,
      required this.itemPubDate,
      required this.itemThumbnail});

  Map<String, dynamic> toJson() {
    return {
      "Title": itemTitle,
      "Date": itemPubDate,
      "Description": itemDescription,
      "Thumbnail": itemThumbnail
    };
  }

  factory itemPost.fromJson(Map<String, dynamic> json) {
    return itemPost(
        itemTitle: json['Title'],
        itemDescription: json['Description'],
        itemPubDate: json['Date'],
        itemThumbnail: json['Thumbnail']);
  }
}
