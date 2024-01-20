## Flutter Swipe Tutorial
This is used to create a swipe tutorial for your flutter app easily.

<p float="left">
  <img src="https://raw.githubusercontent.com/jillellamudisurya/flutter_swipe_tutorial/master/assets/left_to_right.gif" width="200" />
  <img src="https://raw.githubusercontent.com/jillellamudisurya/flutter_swipe_tutorial/master/assets/right_to_left.gif" width="200" /> 
  <img src="https://raw.githubusercontent.com/jillellamudisurya/flutter_swipe_tutorial/master/assets/top_to_bottom.gif" width="200" />
  <img src="https://raw.githubusercontent.com/jillellamudisurya/flutter_swipe_tutorial/master/assets/bottom_to_top.gif" width="200" />
</p>

<p>
     <a href="https://pub.dev/packages/flutter_swipe_tutorial" target="_blank"><img src="https://img.shields.io/badge/pub-v1.0.4-blue" /></a>
</p>

## Installation
`$ flutter pub add flutter_swipe_tutorial`

## Usage
Wrap You Widget With Swipe Tutorial to get the swipe tutorial effect.
```dart
import 'package:flutter/material.dart';
import 'package:flutter_swipe_tutorial/flutter_swipe_tutorial.dart';

class SwipeTutorialExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Swipe Tutorial Example'),
        ),
        body: SwipeTutorial(
        Center(
          child: Text('Swipe Tutorial Example'),
        ),
      ),
    );
  }
}
```

## Properties
Swipe Tutorial Widget has the following properties:

| Property                | Type                  | Description                                          |
|-------------------------|-----------------------|------------------------------------------------------|
| child                   | Widget                | The widget to be wrapped with swipe tutorial         |
| swipeDirection          | SwipeDirection        | The direction of the swipe tutorial                  |
| backgroundColor         | Color                 | The background color of the swipe tutorial           |
| animationBoxHeight      | double                | Height of the Animation Widget Contained Box         |
| animationBoxWidth       | double                | Width of the Animation Widget Contained Box          |
| animationController     | AnimationController   | The animation controller of the swipe tutorial       |
| animation               | Animation<double>     | The animation of the swipe tutorial                  |
| showTutorial            | bool                  | To display or hide the swipe tutorial                |
| tutorialWidgetAlignment | Alignment             | Alignment of the Swipe Tutorial Child Widget         |
| padding                 | EdgeInsetsGeometry    | Padding inside Swipe Tutorial Widget                 |

