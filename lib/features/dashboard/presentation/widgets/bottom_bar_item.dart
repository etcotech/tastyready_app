import 'package:flutter/material.dart';

class BottomBarItem extends StatelessWidget {
  final IconData? icon;
  final bool? isSelected;
  final Function()? onTap;
   const BottomBarItem({super.key, this.icon, this.isSelected=false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return 

    
InkWell(
  onTap: (){
    onTap!();
  },
  child: AnimatedCrossFade(firstChild: 
  SizedBox(
    width: 40,height: 40,
    child: Icon(icon , 
    // size: 16,
    ),
  )
  
  , secondChild: 
  
  Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      shape: BoxShape.circle , 
      color: Theme.of(context).primaryColor , 
  
    ),
    child: Center(
      child: Icon(icon , 
      color: Colors.white,
  // size: 20,
  ),
    ),
  )
  
  , crossFadeState: 
  isSelected!?
  CrossFadeState.showSecond: CrossFadeState.showFirst
  
  ,
  // firstCurve: Curves.bounceIn,
  // secondCurve: Curves.bounceOut,
  sizeCurve: Curves.bounceIn,
   duration: Duration(
    milliseconds: 300
  )),
);


  }
}