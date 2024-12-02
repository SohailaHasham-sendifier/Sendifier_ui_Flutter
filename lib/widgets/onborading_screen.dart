import 'package:flutter/material.dart';
import 'package:sendifier/widgets/signup_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Import the package

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView with OnboardingPages
          PageView(
            controller: _controller, // Attach the controller to the PageView
            children: [
              OnboardingPage(
                backgroundImage: 'assets/images/background7.png', // Background image
                vectorImage: 'assets/images/vetor.png', // Vector image (PNG)
                mainText: "You will achieve much with your business",
                subText:
                "Unify your social media presence effortlessly.\nManage multiple accounts, posts, and interactions from a single hub.\nExperience seamless usability with our intuitive design.\nElevate engagement and efficiency with Sendifier!",
              ),
              OnboardingPage(
                backgroundImage: 'assets/images/background7.png', // Another example of a different background
                vectorImage: 'assets/images/vetor_2.png', // Another example of a different vector image
                mainText: "Maximize Your Productivity",
                subText:
                "Streamline your tasks and boost your productivity with our all-in-one tool.\nManage everything from one platform and save time.",
              ),
              // Add more OnboardingPage widgets for additional screens as needed
            ],
          ),
          // Add page indicator
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0), // Space from the bottom
              child: SmoothPageIndicator(
                controller: _controller, // Page controller
                count: 2, // Number of pages (adjust if more pages are added)
                effect: WormEffect( // You can choose different effects
                  dotHeight: 10.0,
                  dotWidth: 10.0,
                  spacing: 16.0,
                  dotColor: Colors.blue.withOpacity(0.5),
                  activeDotColor: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
      // Floating Action Button to navigate between pages
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.page != null && _controller.page! < 1) {
            _controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          } else {
            // Navigate to SignUpScreen after the last page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>  SignUpScreen()),
            );
          }
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String backgroundImage;
  final String vectorImage;
  final String mainText;
  final String subText;

  const OnboardingPage({
    Key? key,
    required this.backgroundImage,
    required this.vectorImage,
    required this.mainText,
    required this.subText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Positioned.fill(
          child: Image.asset(
            backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        // Content (Logo and Text)
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Vector Image (Centered)
              Image.asset(
                vectorImage, // Path to your PNG vector image
                width: 200, // Adjust size as needed
                height: 200,
              ),
              // Main text (larger, bold)
              Text(
                mainText,
                style: const TextStyle(
                  fontSize: 24, // Larger size
                  fontWeight: FontWeight.bold, // Bold text
                  color: Colors.black, // Text color
                ),
                textAlign: TextAlign.center,
              ),
              // Small text (below main text)
              const SizedBox(height: 20), // Space between texts
              Text(
                subText,
                style: const TextStyle(
                  fontSize: 14, // Smaller size
                  color: Colors.black54, // Lighter text color
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}


