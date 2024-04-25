class Asset {
  final String name;
  final String? symbol;
  final num? value;
  final String logo;
  final num percentage;
  final bool? profit;

  Asset({
    required this.name,
    this.symbol,
    this.value,
    required this.logo,
    required this.percentage,
    this.profit,
  });
}
