import 'package:flutter/material.dart';
import 'package:flutter_plant_shop/constant.dart';
import 'package:flutter_plant_shop/screens/home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List images = [
    "assets/snake-plants.png",
    "assets/lucky-jade-plants.png",
    "assets/mini-plant.png",
    // "assets/peperomia-plant.png",
    // "assets/small-plants.png",
  ];

  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      appBar: AppBar(
        backgroundColor: kcontentColor,
        actions: [
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.grey.shade800),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            child: const Text('Skip'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 350,
              child: PageView.builder(
                controller: pageController,
                itemCount: images.length,
                onPageChanged: (value) => setState(
                  () {
                    currentIndex = value;
                  },
                ),
                itemBuilder: (context, index) => Image.asset(
                  images[index],
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
                (index) => AnimatedContainer(
                  duration: const Duration(microseconds: 300),
                  width: index == currentIndex ? 10 : 6,
                  margin: const EdgeInsets.all(2),
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: index == currentIndex
                        ? kprimaryColor
                        : Colors.grey.shade400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Enjoy your life with ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 42,
                      ),
                    ),
                    TextSpan(
                      text: 'Plants',
                      style: TextStyle(
                        color: kprimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 42,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: IconButton(
                onPressed: () async {
                  if (currentIndex == images.length - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  } else {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
                style: IconButton.styleFrom(
                  fixedSize: const Size(80, 80),
                  backgroundColor: kprimaryColor,
                  iconSize: 40,
                ), // This is the function that gets called when the button is tapped
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ), // This is the icon for the button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
