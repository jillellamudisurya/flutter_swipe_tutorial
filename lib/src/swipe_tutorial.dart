import 'package:flutter/material.dart';
import 'package:flutter_swipe_tutorial/flutter_swipe_tutorial.dart';

class SwipeTutorial extends StatefulWidget {
  final Widget child;
  final String text;
  final Widget? iconWidget;
  final TextStyle textStyle;
  final bool showTutorial;
  final SwipeDirection swipeDirection;
  final AnimationController? animationController;
  final Animation<double>? animation;
  final Color backgroundColor;
  final double? animationBoxHeight;
  final double? animationBoxWidth;
  final Alignment tutorialWidgetAlignment;
  final EdgeInsetsGeometry padding;
  const SwipeTutorial({
    super.key,
    required this.child,
    required this.text,
    this.iconWidget,
    this.showTutorial = true,
    this.swipeDirection = SwipeDirection.rightToLeft,
    this.animationController,
    this.animation,
    this.textStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    this.backgroundColor = Colors.black,
    this.animationBoxHeight,
    this.animationBoxWidth,
    this.tutorialWidgetAlignment = const Alignment(0.0, 0.0),
    this.padding = const EdgeInsets.all(16),
  });

  @override
  State<SwipeTutorial> createState() => _SwipeTutorialState();
}

class _SwipeTutorialState extends State<SwipeTutorial>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = widget.animationController ??
        AnimationController(
            duration: const Duration(milliseconds: 1500), vsync: this)
      ..repeat();
    _animation = widget.animation ?? _createAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Animation<double> _createAnimation() {
    switch (widget.swipeDirection) {
      case SwipeDirection.rightToLeft:
      case SwipeDirection.bottomToTop:
        return Tween<double>(begin: 1.0, end: -1.0).animate(
          CurvedAnimation(
              parent: _animationController, curve: Curves.easeInOutQuart),
        );
      case SwipeDirection.leftToRight:
      case SwipeDirection.topToBottom:
        return Tween<double>(begin: -1.0, end: 1.0).animate(
          CurvedAnimation(
              parent: _animationController, curve: Curves.easeInOutQuart),
        );
      default:
        return Tween<double>(begin: 1.0, end: -1.0).animate(
          CurvedAnimation(
              parent: _animationController, curve: Curves.easeInOutQuart),
        );
    }
  }

  Widget _icon() {
    final Widget? iconWidget = widget.iconWidget;
    if (iconWidget != null) {
      return iconWidget;
    }
    switch (widget.swipeDirection) {
      case SwipeDirection.rightToLeft:
        return const Icon(
          Icons.swipe_left,
          color: Colors.white,
          size: 50,
        );
      case SwipeDirection.leftToRight:
        return const Icon(
          Icons.swipe_right,
          color: Colors.white,
          size: 50,
        );
      case SwipeDirection.topToBottom:
        return const Icon(
          Icons.swipe_down,
          color: Colors.white,
          size: 50,
        );
      case SwipeDirection.bottomToTop:
        return const Icon(
          Icons.swipe_up,
          color: Colors.white,
          size: 50,
        );
    }
  }

  double _getOpacity() {
    double opacity;
    const fadeRange = 0.2;
    if (_animation.value > -0.8 && _animation.value < 0.8) {
      opacity = 1.0;
    } else if (_animation.value <= -0.8) {
      opacity = (_animation.value + 1.0) / fadeRange;
    } else {
      opacity = (1.0 - _animation.value) / fadeRange;
    }
    return opacity.clamp(0.0, 1.0);
  }

  double _getContainerHeight() {
    switch (widget.swipeDirection) {
      case SwipeDirection.rightToLeft:
      case SwipeDirection.leftToRight:
        return widget.animationBoxHeight ?? 50;
      case SwipeDirection.topToBottom:
      case SwipeDirection.bottomToTop:
        return widget.animationBoxHeight ??
            MediaQuery.of(context).size.height / 3;
    }
  }

  double _getContainerWidth() {
    switch (widget.swipeDirection) {
      case SwipeDirection.rightToLeft:
      case SwipeDirection.leftToRight:
        return widget.animationBoxWidth ??
            MediaQuery.of(context).size.width * 0.6;
      case SwipeDirection.topToBottom:
      case SwipeDirection.bottomToTop:
        return widget.animationBoxWidth ?? double.infinity;
    }
  }

  AlignmentGeometry _getAlignment() {
    switch (widget.swipeDirection) {
      case SwipeDirection.rightToLeft:
      case SwipeDirection.leftToRight:
        return Alignment(_animation.value, 0.0);
      case SwipeDirection.topToBottom:
      case SwipeDirection.bottomToTop:
        return Alignment(0.0, _animation.value);
    }
  }

  Widget _getTextWidget() {
    return Text(
      widget.text,
      textScaleFactor: 1.0,
      style: widget.textStyle,
      textAlign: TextAlign.center,
    );
  }

  Widget _getInnerChild() {
    List<SwipeDirection> verticalSwipeDirections = [
      SwipeDirection.topToBottom,
      SwipeDirection.bottomToTop,
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!verticalSwipeDirections.contains(widget.swipeDirection)) ...[
          _getTextWidget(),
          const SizedBox(height: 24),
        ],
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            double opacity = _getOpacity();
            return Container(
              width: _getContainerWidth(),
              height: _getContainerHeight(),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Opacity(
                opacity: opacity,
                child: Align(
                  alignment: _getAlignment(),
                  child: _icon(),
                ),
              ),
            );
          },
        ),
        if (verticalSwipeDirections.contains(widget.swipeDirection)) ...[
          const SizedBox(height: 24),
          _getTextWidget(),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (widget.showTutorial) ...[
          IgnorePointer(
            ignoring: true,
            child: Container(
              width: double.infinity,
              padding: widget.padding,
              decoration: BoxDecoration(
                color: widget.backgroundColor.withOpacity(0.6),
              ),
              child: Align(
                alignment: widget.tutorialWidgetAlignment,
                child: _getInnerChild(),
              ),
            ),
          )
        ]
      ],
    );
  }
}
