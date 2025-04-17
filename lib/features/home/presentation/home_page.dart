import 'package:flutter/material.dart';
import 'package:tastyready_mobile/features/home/presentation/widgets/location_widget_home.dart';
import 'package:tastyready_mobile/features/home/presentation/widgets/search_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    

  return  Scaffold(
body: SingleChildScrollView(


child:Column(children: [
  SizedBox(
            height: 70,
          ),
          LocationWidgetHome(), 
          const SizedBox(
            height: 16,
          ),
  SearchContainer(),
],),
),

  );
  
  }



}