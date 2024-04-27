class BitcoinLatestBlockTransactionsResponseModel {
  String? hash;
  int? ver;
  String? prevBlock;
  String? mrklRoot;
  int? time;
  int? bits;
  List<dynamic>? nextBlock;
  int? fee;
  int? nonce;
  int? nTx;
  int? size;
  int? blockIndex;
  bool? mainChain;
  int? height;
  int? weight;
  List<Tx>? tx;

  BitcoinLatestBlockTransactionsResponseModel({
    this.hash,
    this.ver,
    this.prevBlock,
    this.mrklRoot,
    this.time,
    this.bits,
    this.nextBlock,
    this.fee,
    this.nonce,
    this.nTx,
    this.size,
    this.blockIndex,
    this.mainChain,
    this.height,
    this.weight,
    this.tx,
  });

  factory BitcoinLatestBlockTransactionsResponseModel.fromJson(Map<String, dynamic> json) => BitcoinLatestBlockTransactionsResponseModel(
        hash: json["hash"],
        ver: json["ver"],
        prevBlock: json["prev_block"],
        mrklRoot: json["mrkl_root"],
        time: json["time"],
        bits: json["bits"],
        nextBlock: json["next_block"] == null ? [] : List<dynamic>.from(json["next_block"]!.map((x) => x)),
        fee: json["fee"],
        nonce: json["nonce"],
        nTx: json["n_tx"],
        size: json["size"],
        blockIndex: json["block_index"],
        mainChain: json["main_chain"],
        height: json["height"],
        weight: json["weight"],
        tx: json["tx"] == null ? [] : List<Tx>.from(json["tx"]!.map((x) => Tx.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hash": hash,
        "ver": ver,
        "prev_block": prevBlock,
        "mrkl_root": mrklRoot,
        "time": time,
        "bits": bits,
        "next_block": nextBlock == null ? [] : List<dynamic>.from(nextBlock!.map((x) => x)),
        "fee": fee,
        "nonce": nonce,
        "n_tx": nTx,
        "size": size,
        "block_index": blockIndex,
        "main_chain": mainChain,
        "height": height,
        "weight": weight,
        "tx": tx == null ? [] : List<dynamic>.from(tx!.map((x) => x.toJson())),
      };
}

class Tx {
  String? hash;
  int? ver;
  int? vinSz;
  int? voutSz;
  int? size;
  int? weight;
  int? fee;
  String? relayedBy;
  int? lockTime;
  int? txIndex;
  bool? doubleSpend;
  int? time;
  int? blockIndex;
  int? blockHeight;
  List<Input>? inputs;
  List<Out>? out;

  Tx({
    this.hash,
    this.ver,
    this.vinSz,
    this.voutSz,
    this.size,
    this.weight,
    this.fee,
    this.relayedBy,
    this.lockTime,
    this.txIndex,
    this.doubleSpend,
    this.time,
    this.blockIndex,
    this.blockHeight,
    this.inputs,
    this.out,
  });

  factory Tx.fromJson(Map<String, dynamic> json) => Tx(
        hash: json["hash"],
        ver: json["ver"],
        vinSz: json["vin_sz"],
        voutSz: json["vout_sz"],
        size: json["size"],
        weight: json["weight"],
        fee: json["fee"],
        relayedBy: json["relayed_by"],
        lockTime: json["lock_time"],
        txIndex: json["tx_index"],
        doubleSpend: json["double_spend"],
        time: json["time"],
        blockIndex: json["block_index"],
        blockHeight: json["block_height"],
        inputs: json["inputs"] == null ? [] : List<Input>.from(json["inputs"]!.map((x) => Input.fromJson(x))),
        out: json["out"] == null ? [] : List<Out>.from(json["out"]!.map((x) => Out.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hash": hash,
        "ver": ver,
        "vin_sz": vinSz,
        "vout_sz": voutSz,
        "size": size,
        "weight": weight,
        "fee": fee,
        "relayed_by": relayedBy,
        "lock_time": lockTime,
        "tx_index": txIndex,
        "double_spend": doubleSpend,
        "time": time,
        "block_index": blockIndex,
        "block_height": blockHeight,
        "inputs": inputs == null ? [] : List<dynamic>.from(inputs!.map((x) => x.toJson())),
        "out": out == null ? [] : List<dynamic>.from(out!.map((x) => x.toJson())),
      };
}

class Input {
  int? sequence;
  String? witness;
  String? script;
  int? index;
  Out? prevOut;

  Input({
    this.sequence,
    this.witness,
    this.script,
    this.index,
    this.prevOut,
  });

  factory Input.fromJson(Map<String, dynamic> json) => Input(
        sequence: json["sequence"],
        witness: json["witness"],
        script: json["script"],
        index: json["index"],
        prevOut: json["prev_out"] == null ? null : Out.fromJson(json["prev_out"]),
      );

  Map<String, dynamic> toJson() => {
        "sequence": sequence,
        "witness": witness,
        "script": script,
        "index": index,
        "prev_out": prevOut?.toJson(),
      };
}

class Out {
  int? type;
  bool? spent;
  int? value;
  List<SpendingOutpoint>? spendingOutpoints;
  int? n;
  int? txIndex;
  String? script;
  String? addr;

  Out({
    this.type,
    this.spent,
    this.value,
    this.spendingOutpoints,
    this.n,
    this.txIndex,
    this.script,
    this.addr,
  });

  factory Out.fromJson(Map<String, dynamic> json) => Out(
        type: json["type"],
        spent: json["spent"],
        value: json["value"],
        spendingOutpoints: json["spending_outpoints"] == null
            ? []
            : List<SpendingOutpoint>.from(json["spending_outpoints"]!.map((x) => SpendingOutpoint.fromJson(x))),
        n: json["n"],
        txIndex: json["tx_index"],
        script: json["script"],
        addr: json["addr"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "spent": spent,
        "value": value,
        "spending_outpoints": spendingOutpoints == null ? [] : List<dynamic>.from(spendingOutpoints!.map((x) => x.toJson())),
        "n": n,
        "tx_index": txIndex,
        "script": script,
        "addr": addr,
      };
}

class SpendingOutpoint {
  int? txIndex;
  int? n;

  SpendingOutpoint({
    this.txIndex,
    this.n,
  });

  factory SpendingOutpoint.fromJson(Map<String, dynamic> json) => SpendingOutpoint(
        txIndex: json["tx_index"],
        n: json["n"],
      );

  Map<String, dynamic> toJson() => {
        "tx_index": txIndex,
        "n": n,
      };
}
