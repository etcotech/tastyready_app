import 'package:flutter/material.dart';

void showAnimatedSnackBar(BuildContext context, {
  String? message = '',
  
  required bool isSuccess}) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          AnimatedSnackBarIcon(isSuccess: isSuccess),
          SizedBox(width: 10),
          Text(
           message!,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      duration: Duration(seconds: 3),
      animation: CurvedAnimation(
        parent: ModalRoute.of(context)!.animation!,
        curve: Curves.easeInOut,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

class AnimatedSnackBarIcon extends StatefulWidget {
  final bool isSuccess;

  const AnimatedSnackBarIcon({super.key, required this.isSuccess});

  @override
  _AnimatedSnackBarIconState createState() => _AnimatedSnackBarIconState();
}

class _AnimatedSnackBarIconState extends State<AnimatedSnackBarIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..forward();
    _rotationAnimation = Tween<double>(begin: .5, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotationAnimation,
      child: Icon(
        widget.isSuccess ? Icons.check_circle : Icons.error,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}