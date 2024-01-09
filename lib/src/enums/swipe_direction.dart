/// Defines the direction of a swipe gesture.
///
/// This enumeration is used to specify the direction in which a swipe
/// gesture is expected to occur or has occurred.
///
/// - `leftToRight`: Represents a swipe gesture that starts from the left
///   edge and moves towards the right edge of the screen.
///
/// - `rightToLeft`: Represents a swipe gesture that starts from the right
///   edge and moves towards the left edge of the screen.
///
/// - `topToBottom`: Represents a swipe gesture that starts from the top
///   edge and moves towards the bottom edge of the screen.
///
/// - `bottomToTop`: Represents a swipe gesture that starts from the bottom
///   edge and moves towards the top edge of the screen.
///
/// Usage:
/// ```dart
/// SwipeDirection direction = SwipeDirection.leftToRight;
///
/// // You can use this enum to control the behavior of your swipe
/// // gestures in your application.
/// ```
enum SwipeDirection {
  /// Swipe from left to right.
  leftToRight,

  /// Swipe from right to left.
  rightToLeft,

  /// Swipe from top to bottom.
  topToBottom,

  /// Swipe from bottom to top.
  bottomToTop,
}
