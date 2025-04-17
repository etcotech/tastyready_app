import 'package:flutter/material.dart';

class LoginOptionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final Color? color;
  final Color? textColor;
  final IconData? icon;
  final bool? isLoading;
  const LoginOptionButton({super.key, this.onPressed, this.text, this.color, this.textColor, this.isLoading, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
      
       onPressed,
      child: Container(
        width: double.infinity,
        height: 50,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          // color: color ?? Theme.of(context).primaryColor,
          border: Border.all(
            color: Colors.black,
            width: .8,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child:  Center(
          child:
          // isLoading!?
          // const CircularProgressIndicator(
          //   color: Colors.white,
          //   strokeWidth: .5,
          // )
          // :
          
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
             children: [
                        
                           Icon(
                           icon??Icons.email_outlined,
                            color: Colors.black,
                          ),
               Text(
               text??'Continue with Email',
                style: TextStyle(
                  color: textColor ?? Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                         ),

                         SizedBox()
             ],
           ),
        ),
      ),
    );
  }
}