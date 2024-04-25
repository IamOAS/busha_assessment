import 'package:busha_assessment/core/utils/exports.dart';

StateProvider<List<Asset>> assetsProvider = StateProvider(
  (ref) => [
    Asset(
      name: 'Bitcoin',
      symbol: 'BTC',
      value: 2450000,
      percentage: 1.76,
      logo: 'btc',
      profit: true,
    ),
    Asset(
      name: 'Ethereum',
      symbol: 'ETH',
      value: 4500,
      percentage: 6.76,
      logo: 'eth',
      profit: false,
    ),
    Asset(
      name: 'Tezos',
      symbol: 'XTZ',
      value: 4500,
      percentage: 9.06,
      logo: 'tezos',
      profit: true,
    ),
  ],
);

StateProvider<List<Asset>> todayTopMoversProvider = StateProvider(
  (ref) => [
    Asset(
      name: 'Ethereum',
      percentage: 1.76,
      logo: 'eth',
      profit: false,
    ),
    Asset(
      name: 'Bitcoin',
      percentage: 1.76,
      logo: 'btc',
      profit: true,
    ),
    Asset(
      name: 'Solana',
      percentage: 1.76,
      logo: 'sol',
      profit: true,
    ),
  ],
);
