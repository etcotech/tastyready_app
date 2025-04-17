import 'package:flutter/material.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({super.key});

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width,
      child: Row(
        spacing: 16, 
        children: [
          
      Expanded(
        child: Container(
          height: 50,
          // width: double.infinity  ,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
        
          children: [
        
              Text(
              'Search Here',
              style: TextStyle(
                fontSize: 14,
               color: Colors.grey[500])
              ),
            
             Icon(Icons.search, color: Colors.grey[500]),
           
        
          ],
        ),
          ),
        ),
      ), 

Container(
          height: 50,
          width: 50,
 decoration: BoxDecoration(
  color: Theme.of(context).primaryColor, 
  borderRadius: BorderRadius.circular(10),
 ),
 child: Center(
   child: Icon(Icons.tune_outlined, color: Colors.white, size: 20,),
 ),
        ),
        
        // Icon(Icons.filter_list, color: Colors.white, size: 20,),
        // Container(
        //   height: 50,
        //   width: 50,
        //   decoration: BoxDecoration(
        //     color: Theme.of(context).primaryColor,
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        //   child: Center(
        //     child: Icon(Icons.filter_list, color: Colors.white, size: 20,),
        //   ),
        // ),

      
    
        ],




      ),
    );
  }
}