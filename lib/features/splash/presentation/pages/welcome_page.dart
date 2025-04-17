import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tastyready_mobile/core/constants/images.dart';
import 'package:tastyready_mobile/core/constants/translate.dart';
import 'package:tastyready_mobile/core/widgets/alerts.dart';
import 'package:tastyready_mobile/core/widgets/main_button.dart';
import 'package:tastyready_mobile/features/auth/presentation/pages/login_page.dart';
import 'package:tastyready_mobile/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:tastyready_mobile/features/splash/presentation/bloc/splash_event.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

     List<WelcomeSlide> _slides =[];
@override
  void initState() {
    // TODO: implement initState
    super.initState();


    // WidgetsBinding.instance.addPostFrameCallback((_){


_slides = [
    WelcomeSlide(
      title: getTranslated("welcome", context)!,
      description: 'Discover amazing features that will make your life easier',
      image: AppImages.splash1,
      color: Colors.blue,
    ),
    WelcomeSlide(
      title: 'Easy to Use',
      description: 'Simple and intuitive interface for all users',
      image: AppImages.splash2,
      color: Colors.green,
    ),
    WelcomeSlide(
      title: 'Fast Delivery',
      description: 'Join our community and start your journey today',
          image: AppImages.splash3,

      color: Colors.orange,
    ),
  ];


    // });
  }
  
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _slides.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return WelcomePage(slide: _slides[index]);
            },
          ),

          PositionedDirectional(
            
            end: 20, 
            top: 50,
            child: TextButton(onPressed: (){

              context.read<SplashBloc>().add(
                UpdateirstTime(false)
              );

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );

          }, child: Text('Skip'))), 
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // Page indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _slides.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 20 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? _slides[index].color
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Next/Get Started button
                if (_currentPage == _slides.length - 1)

Padding(
  padding: const EdgeInsets.symmetric(

    horizontal: 25
  ),
  child: MainButton(
    text: getTranslated("get_started", context),
    isLoading: false  ,
    textColor: Colors.white 
    ,
    color: _slides[_currentPage].color,
    
  
     onPressed: () {
  
// showCustomAlert(context: context, title: "Test", content: "test", icon: Icons.close);




  
                            context.read<SplashBloc>().add(
  
                              UpdateirstTime(false)
                            );
  
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );


                        
                      },
  ),
)


/*
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: _slides[_currentPage].color,
                    ),
                    onPressed: () {

                          context.read<SplashBloc>().add(

                            UpdateirstTime(false)
                          );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  )
*/

                else
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      color: _slides[_currentPage].color,
                      size: 36,
                    ),
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeSlide {
  final String title;
  final String description;
  final String image;
  final Color color;

  WelcomeSlide({
    required this.title,
    required this.description,
    required this.image,
    required this.color,
  });
}

class WelcomePage extends StatelessWidget {
  final WelcomeSlide slide;

  const WelcomePage({super.key, required this.slide});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: slide.color.withOpacity(0.1),
      color: Colors.white,
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            slide.image,
            height: 120,width: 120,
            // color: slide.color,
          ),
          const SizedBox(height: 40),
          Text(
            slide.title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: slide.color,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            slide.description,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Your existing RegistrationPage class goes here