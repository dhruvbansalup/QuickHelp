
import 'package:flutter/material.dart';
import 'package:quick_help/utils/constants/sizing.dart';

class QSpacingStyles{

  static const EdgeInsetsGeometry paddingWithAppBar = EdgeInsets.only(
    top: QSizes.AppBarHeight,
    left: QSizes.defaultSpace,
    right: QSizes.defaultSpace,
    bottom: QSizes.defaultSpace,
  );

  static const EdgeInsetsGeometry paddingInsideButton = EdgeInsets.symmetric(
    vertical: QSizes.md,
    horizontal: QSizes.lg,
  );
}