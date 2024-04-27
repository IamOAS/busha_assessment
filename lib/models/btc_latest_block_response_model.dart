/// This file contains the model that will be used to parse the response from the API for the latest block of Bitcoin.
class BitcoinLatestBlockResponseModel {
  String? hash;
  int? time;
  int? blockIndex;
  int? height;
  List<int>? txIndexes;

  BitcoinLatestBlockResponseModel({
    this.hash,
    this.time,
    this.blockIndex,
    this.height,
    this.txIndexes,
  });

  factory BitcoinLatestBlockResponseModel.fromJson(Map<String, dynamic> json) => BitcoinLatestBlockResponseModel(
        hash: json["hash"],
        time: json["time"],
        blockIndex: json["block_index"],
        height: json["height"],
        txIndexes: json["txIndexes"] == null ? [] : List<int>.from(json["txIndexes"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "hash": hash,
        "time": time,
        "block_index": blockIndex,
        "height": height,
      };
}
