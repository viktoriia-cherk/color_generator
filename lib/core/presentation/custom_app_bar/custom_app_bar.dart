import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import 'custom_title.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final double? leadingWidth;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double? elevation;
  final double? appBarHeight;
  final Color? surfaceTintColor;
  final bool? centerTitle;
  final TextStyle? titleTextStyle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.leadingWidth,
    this.actions,
    this.backgroundColor,
    this.elevation,
    this.appBarHeight,
    this.surfaceTintColor,
    this.centerTitle,
    this.titleTextStyle,
  });

  factory CustomAppBar.colorGeneratorPage({
    List<Widget>? actions,
    Color? backgroundColor,
    double? appBarHeight,
    Color? surfaceTintColor,
    bool? centerTitle,
    TextStyle? titleTextStyle,
  }) => CustomAppBar(
    backgroundColor: AppColors.transparent,
    title: 'Color Generator',
    leading: const SizedBox(),
    leadingWidth: 0,
    actions: actions,
    elevation: 0,
    surfaceTintColor: surfaceTintColor,
    centerTitle: centerTitle,
    titleTextStyle: titleTextStyle,
  );

  factory CustomAppBar.history({
    List<Widget>? actions,
    Color? backgroundColor,
    double? appBarHeight,
    Color? surfaceTintColor,
    bool? centerTitle,
    TextStyle? titleTextStyle,
    String? subtitle,
  }) => CustomAppBar(
    backgroundColor: AppColors.transparent,
    title: 'History',
    subtitle: subtitle,
    leading: const SizedBox(),
    leadingWidth: 0,
    actions: actions,
    elevation: 0,
    surfaceTintColor: surfaceTintColor,
    centerTitle: centerTitle,
    titleTextStyle: titleTextStyle,
  );

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight ?? 56);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomTitle(title: widget.title, subtitle: widget.subtitle),
      automaticallyImplyLeading: false,
      actions: widget.actions,
      titleTextStyle: widget.titleTextStyle,
      backgroundColor: widget.backgroundColor,
      leading:
          widget.leading ??
          Container(
            padding: const EdgeInsets.all(6.0),
            child: const BackButton(),
          ),
      leadingWidth: widget.leadingWidth ?? 56,
      scrolledUnderElevation: 0,
      elevation: widget.elevation,
      surfaceTintColor: widget.surfaceTintColor,
      centerTitle: widget.centerTitle,
    );
  }
}
