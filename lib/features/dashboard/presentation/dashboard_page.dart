import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tastyready_mobile/features/dashboard/presentation/widgets/bottom_bar_item.dart';
import 'package:tastyready_mobile/features/home/presentation/home_page.dart';
import 'package:tastyready_mobile/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:tastyready_mobile/features/splash/presentation/bloc/splash_event.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
   int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Center(child: Text('Search Page')),
    Center(child: Text('Orders Page')),
    Center(child: Text('Profile Page')),
        Center(child: Text('Profile Page')),

    Center(child: Text('Profile Page')),

  ];
@override
  void initState() {
    // TODO: implement initState
    super.initState();

     context.read<SplashBloc>().add(LoadAppSettings());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar:
      Container(
        height: 100,
        padding: EdgeInsets.symmetric(
          horizontal: 20,vertical: 15
        ),
        decoration: BoxDecoration(
          color: Colors.white , 
          borderRadius: BorderRadius.vertical(
          top: Radius.circular(5)
          )
          
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
BottomBarItem(
  icon:Icons.home_outlined , 
  isSelected: _currentIndex==0,
  onTap: (){
_currentIndex = 0;
setState(() {
  
});
  },
)
, 

BottomBarItem(
  icon:Icons.category_outlined , 
  isSelected: _currentIndex==1,
  onTap: (){
_currentIndex = 1;
setState(() {
  
});
  },
)

            
            , 

BottomBarItem(
  icon:Icons.shopping_bag_outlined , 
  isSelected: _currentIndex==2,
  onTap: (){
_currentIndex = 2;
setState(() {
  
});
  },
)

            
            , 

BottomBarItem(
  icon:Icons.favorite_outline , 
  isSelected: _currentIndex==3,
  onTap: (){
_currentIndex = 3;
setState(() {
  
});
  },
)

            
            ,

                                                
                                                
                                                
       BottomBarItem(
  icon:Icons.notifications_outlined , 
  isSelected: _currentIndex==4,
  onTap: (){
_currentIndex = 4;
setState(() {
  
});
  },
)

            
            ,

 

          ],
        ),

      )
      
      //  BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      //   type: BottomNavigationBarType.fixed,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: 'Search',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_bag),
      //       label: 'Orders',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
    
    
    
    );
  }
}