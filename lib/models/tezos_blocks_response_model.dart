class TezosBlocksResponseModel {
  List<Block>? blocks;

  TezosBlocksResponseModel({
    this.blocks,
  });

  factory TezosBlocksResponseModel.fromJson(Map<String, dynamic> json) => TezosBlocksResponseModel(
        blocks: json["blocks"] == null ? [] : List<Block>.from(json["blocks"]!.map((x) => Block.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "blocks": blocks == null ? [] : List<dynamic>.from(blocks!.map((x) => x.toJson())),
      };
}

class Block {
  int? cycle;
  int? level;
  String? hash;
  DateTime? timestamp;
  int? proto;
  int? payloadRound;
  int? blockRound;
  int? validations;
  int? deposit;
  int? rewardLiquid;
  int? rewardStakedOwn;
  int? rewardStakedShared;
  int? bonusLiquid;
  int? bonusStakedOwn;
  int? bonusStakedShared;
  int? fees;
  bool? nonceRevealed;
  Baker? proposer;
  Baker? producer;
  Software? software;
  int? lbToggleEma;
  int? aiToggleEma;
  int? reward;
  int? bonus;
  int? priority;
  Baker? baker;
  bool? lbEscapeVote;
  int? lbEscapeEma;
  bool? lbToggle;

  Block({
    this.cycle,
    this.level,
    this.hash,
    this.timestamp,
    this.proto,
    this.payloadRound,
    this.blockRound,
    this.validations,
    this.deposit,
    this.rewardLiquid,
    this.rewardStakedOwn,
    this.rewardStakedShared,
    this.bonusLiquid,
    this.bonusStakedOwn,
    this.bonusStakedShared,
    this.fees,
    this.nonceRevealed,
    this.proposer,
    this.producer,
    this.software,
    this.lbToggleEma,
    this.aiToggleEma,
    this.reward,
    this.bonus,
    this.priority,
    this.baker,
    this.lbEscapeVote,
    this.lbEscapeEma,
    this.lbToggle,
  });

  factory Block.fromJson(Map<String, dynamic> json) => Block(
        cycle: json["cycle"],
        level: json["level"],
        hash: json["hash"],
        timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
        proto: json["proto"],
        payloadRound: json["payloadRound"],
        blockRound: json["blockRound"],
        validations: json["validations"],
        deposit: json["deposit"],
        rewardLiquid: json["rewardLiquid"],
        rewardStakedOwn: json["rewardStakedOwn"],
        rewardStakedShared: json["rewardStakedShared"],
        bonusLiquid: json["bonusLiquid"],
        bonusStakedOwn: json["bonusStakedOwn"],
        bonusStakedShared: json["bonusStakedShared"],
        fees: json["fees"],
        nonceRevealed: json["nonceRevealed"],
        proposer: json["proposer"] == null ? null : Baker.fromJson(json["proposer"]),
        producer: json["producer"] == null ? null : Baker.fromJson(json["producer"]),
        software: json["software"] == null ? null : Software.fromJson(json["software"]),
        lbToggleEma: json["lbToggleEma"],
        aiToggleEma: json["aiToggleEma"],
        reward: json["reward"],
        bonus: json["bonus"],
        priority: json["priority"],
        baker: json["baker"] == null ? null : Baker.fromJson(json["baker"]),
        lbEscapeVote: json["lbEscapeVote"],
        lbEscapeEma: json["lbEscapeEma"],
        lbToggle: json["lbToggle"],
      );

  Map<String, dynamic> toJson() => {
        "cycle": cycle,
        "level": level,
        "hash": hash,
        "timestamp": timestamp?.toIso8601String(),
        "proto": proto,
        "payloadRound": payloadRound,
        "blockRound": blockRound,
        "validations": validations,
        "deposit": deposit,
        "rewardLiquid": rewardLiquid,
        "rewardStakedOwn": rewardStakedOwn,
        "rewardStakedShared": rewardStakedShared,
        "bonusLiquid": bonusLiquid,
        "bonusStakedOwn": bonusStakedOwn,
        "bonusStakedShared": bonusStakedShared,
        "fees": fees,
        "nonceRevealed": nonceRevealed,
        "proposer": proposer?.toJson(),
        "producer": producer?.toJson(),
        "software": software?.toJson(),
        "lbToggleEma": lbToggleEma,
        "aiToggleEma": aiToggleEma,
        "reward": reward,
        "bonus": bonus,
        "priority": priority,
        "baker": baker?.toJson(),
        "lbEscapeVote": lbEscapeVote,
        "lbEscapeEma": lbEscapeEma,
        "lbToggle": lbToggle,
      };
}

class Baker {
  String? alias;
  String? address;

  Baker({
    this.alias,
    this.address,
  });

  factory Baker.fromJson(Map<String, dynamic> json) => Baker(
        alias: json["alias"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "alias": alias,
        "address": address,
      };
}

class Software {
  DateTime? date;
  String? version;

  Software({
    this.date,
    this.version,
  });

  factory Software.fromJson(Map<String, dynamic> json) => Software(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "date": date?.toIso8601String(),
        "version": version,
      };
}
