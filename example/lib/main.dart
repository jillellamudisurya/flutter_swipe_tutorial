import 'package:flutter/material.dart';
import 'package:flutter_swipe_tutorial/flutter_swipe_tutorial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SwipeTutorialExample());
  }
}

class SwipeTutorialExample extends StatefulWidget {
  const SwipeTutorialExample({super.key});

  @override
  State<SwipeTutorialExample> createState() => _SwipeTutorialExampleState();
}

class _SwipeTutorialExampleState extends State<SwipeTutorialExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Swipe Tutorial Example"),
      ),
      body: const SwipeTutorial(
        showTutorial: true,
        swipeDirection: SwipeDirection.topToBottom,
        text: "Swipe to the bottom to see more items",
        child: Center(
          child: SizedBox(
            height: 500,
            child: CustomCarousel(),
          ),
        ),
      ),
    );
  }
}

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({super.key});

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      var currentPage = _pageController.page?.round();
      if (currentPage != null && currentPage != _currentPage) {
        setState(() {
          _currentPage = currentPage;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection:
          Axis.vertical, // Uncomment this line to enable vertical scroll
      controller: _pageController,
      padEnds: false,
      itemCount: 10,
      itemBuilder: (_, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 14),
          color: Colors.red,
          child: Center(
            child: Text(
              'Item ${index + 1}',
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
