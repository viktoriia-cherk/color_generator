import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class ToolTips extends StatefulWidget {
  final List<GlobalKey> showcaseKeys;
  final Widget child;
  final bool autoStart;
  final OnShowcaseCallback? onComplete;
  final OnDismissCallback? onDismiss;

  const ToolTips({
    super.key,
    required this.showcaseKeys,
    required this.child,
    this.onComplete,
    this.onDismiss,
    this.autoStart = true,
  });

  @override
  State<ToolTips> createState() => _ToolTipsState();
}

class _ToolTipsState extends State<ToolTips> {
  @override
  void initState() {
    super.initState();
    final lastKey = widget.showcaseKeys[widget.showcaseKeys.length - 1];

    ShowcaseView.register(
      hideFloatingActionWidgetForShowcase: [lastKey],
      globalFloatingActionWidget: (showcaseContext) => FloatingActionWidget(
        left: 16,
        bottom: 16,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () => ShowcaseView.get().dismiss(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffEE5366),
            ),
            child: const Text(
              'Skip',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ),
      blurValue: 1,
      autoPlayDelay: const Duration(seconds: 3),
      globalTooltipActionConfig: const TooltipActionConfig(
        position: TooltipActionPosition.inside,
        alignment: MainAxisAlignment.spaceBetween,
        actionGap: 20,
      ),
      globalTooltipActions: [
        TooltipActionButton(
          type: TooltipDefaultActionType.previous,
          textStyle: const TextStyle(color: Colors.white),
          hideActionWidgetForShowcase: [widget.showcaseKeys[0]],
        ),
        TooltipActionButton(
          type: TooltipDefaultActionType.next,
          textStyle: const TextStyle(color: Colors.white),
          hideActionWidgetForShowcase: [lastKey],
        ),
      ],
      onComplete: widget.onComplete,
      onDismiss: widget.onDismiss,
    );
  }

  @override
  void didUpdateWidget(covariant ToolTips oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!oldWidget.autoStart && widget.autoStart) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ShowcaseView.get().startShowCase(widget.showcaseKeys);
      });
    }
  }

  @override
  void dispose() {
    ShowcaseView.get().unregister();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
