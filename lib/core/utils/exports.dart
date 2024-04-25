// External packages
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:google_fonts/google_fonts.dart';
export 'package:dio/dio.dart';
export 'package:logger/logger.dart';
export 'package:contra/contra.dart';
export 'package:flutter_riverpod/flutter_riverpod.dart';

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
export 'package:busha_assessment/core/extensions/string_extension.dart';
export 'package:busha_assessment/core/utils/theme.dart';
export 'package:busha_assessment/core/services/error_service.dart';
export 'package:busha_assessment/core/services/network_service.dart';
export 'package:busha_assessment/ui/widgets/custom_button.dart';
export 'package:busha_assessment/ui/widgets/custom_text_form_field.dart';
export 'package:busha_assessment/ui/widgets/size_x_svg.dart';

// Controllers exports
export 'package:busha_assessment/controllers/splash_controller.dart';
export 'package:busha_assessment/controllers/dashboard_controller.dart';
export 'package:busha_assessment/controllers/explore_controller.dart';

// Services exports
export 'package:busha_assessment/core/services/navigation_service.dart';

// Providers exports
export 'package:busha_assessment/core/providers/navigation_service_provider.dart';

// Views exports
export 'package:busha_assessment/ui/views/dashboard.dart';
export 'package:busha_assessment/ui/views/login_view.dart';
export 'package:busha_assessment/ui/views/signup_view.dart';
export 'package:busha_assessment/ui/views/splash_view.dart';
