class Asset {
  final String name;
  final String logo;
  final num percentage;
  final String? symbol;
  final num? value;
  final bool? profit;

  Asset({
    required this.name,
    required this.logo,
    required this.percentage,
    this.symbol,
    this.value,
    this.profit,
  });
}
