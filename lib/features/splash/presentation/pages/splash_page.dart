import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tastyready_mobile/core/constants/route_names.dart';
import 'package:tastyready_mobile/core/constants/strings.dart';

import 'package:tastyready_mobile/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:tastyready_mobile/features/splash/presentation/bloc/splash_event.dart';
import 'package:tastyready_mobile/features/splash/presentation/bloc/splash_state.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;



_nextPage()async {
var sharedPrefs= await SharedPreferences.getInstance();


 Future.delayed(const Duration(seconds: 3), () {
var isFirstTime=sharedPrefs.getBool(Strings.isFirstTime)??true;
if(isFirstTime){
  Navigator.pushReplacementNamed(context, RouteNames.welcome);
}else{
  var isLoggedIn =sharedPrefs.getBool(Strings.isLoggedIn)??false;
if(isLoggedIn){
  Navigator.pushReplacementNamed(context, RouteNames.home);
}else{  
  Navigator.pushReplacementNamed(context, RouteNames.login);
}
 }
});
  }



  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
    

     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nextPage();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 

         Scaffold(
          body: 
          
          
          
        Center(
          child: ScaleTransition(
            scale: _animation,
            child: Image.asset(
              'assets/images/logo.png', // Replace with your logo asset path
              width: 150,
              height: 150,
            ),
          ),
        ),

        );
      
  
    
  }
}