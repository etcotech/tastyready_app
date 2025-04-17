import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final Color? color;
  final Color? textColor;
  final bool? isLoading;
  const MainButton({super.key, this.onPressed, this.text, this.color, this.textColor, this.isLoading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
      isLoading!?
      null:
       onPressed,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child:  Center(
          child:
          isLoading!?
          const CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: .5,
          )
          :
          
           Text(
           text??'',
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}