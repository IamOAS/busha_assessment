// External packages
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:google_fonts/google_fonts.dart';
export 'package:dio/dio.dart';
export 'package:logger/logger.dart';
export 'package:contra/contra.dart';
export 'package:flutter_riverpod/flutter_riverpod.dart';
export 'package:intl/intl.dart' hide TextDirection;
export 'package:responsive_grid_list/responsive_grid_list.dart';

// Flutter internal exports
export 'package:flutter/material.dart';
export 'package:flutter/cupertino.dart' hide RefreshCallback;
export 'dart:async' hide AsyncError;
export 'dart:io';
export 'package:flutter/gestures.dart';

// Custom exports
export 'package:busha_assessment/core/extensions/widget_extension.dart';
export 'package:busha_assessment/core/extensions/asset_extension.dart';
export 'package:busha_assessment/main.dart';
export 'package:busha_assessment/core/utils/router.dart';
export 'package:busha_assessment/core/utils/colors.dart';
export 'package:busha_assessment/core/services/url_service.dart';
export 'package:busha_assessment/core/utils/theme.dart';
export 'package:busha_assessment/core/services/error_service.dart';
export 'package:busha_assessment/core/services/network_service.dart';
export 'package:busha_assessment/widgets/custom_button.dart';
export 'package:busha_assessment/widgets/custom_text_form_field.dart';
export 'package:busha_assessment/widgets/size_x_svg.dart';
export 'package:busha_assessment/widgets/explore/explore_divider.dart';
export 'package:busha_assessment/widgets/explore/explore_title.dart';
export 'package:busha_assessment/widgets/explore/explore_my_assets_card.dart';
export 'package:busha_assessment/widgets/explore/my_assets_card_list.dart';
export 'package:busha_assessment/widgets/explore/todays_top_movers_card_list.dart';
export 'package:busha_assessment/widgets/explore/todays_top_movers_container.dart';
export 'package:busha_assessment/widgets/explore/explore_todays_top_movers_card.dart';
export 'package:busha_assessment/widgets/explore/explore_trending_news_card.dart';
export 'package:busha_assessment/widgets/explore/explore_balance_card.dart';
export 'package:busha_assessment/widgets/explore/trending_news_container.dart';
export 'package:busha_assessment/views/explore/all_my_assets_view.dart';
export 'package:busha_assessment/views/explore/all_trending_news_view.dart';
export 'package:busha_assessment/views/explore/all_todays_top_movers_views.dart';

// Controllers exports
export 'package:busha_assessment/controllers/splash_controller.dart';
export 'package:busha_assessment/controllers/dashboard_controller.dart';
export 'package:busha_assessment/controllers/explore_controller.dart';
export 'package:busha_assessment/controllers/my_assets_controller.dart';

// Services exports
export 'package:busha_assessment/core/services/navigation_service.dart';

// Providers exports
export 'package:busha_assessment/core/providers/navigation_service_provider.dart';
export 'package:busha_assessment/core/providers/assets_provider.dart';

// Models exports
export 'package:busha_assessment/models/asset.dart';

// Views exports
export 'package:busha_assessment/views/dashboard.dart';
export 'package:busha_assessment/views/login_view.dart';
export 'package:busha_assessment/views/signup_view.dart';
export 'package:busha_assessment/views/splash_view.dart';
