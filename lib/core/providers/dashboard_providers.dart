import 'package:busha_assessment/core/utils/exports.dart';

StateProvider<int> selectedBottomTabIndex = StateProvider<int>((ref) => 0);
StateProvider<List<String>> labels = StateProvider<List<String>>((ref) => ['Explore', 'Portfolio', 'Earn', 'Spend', 'Connect']);
