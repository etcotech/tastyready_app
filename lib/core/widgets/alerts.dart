import 'package:flutter/material.dart';

void showCustomAlert({
  required BuildContext context,
  required String title,
  required String content,
  required IconData icon,
  Color iconColor = Colors.blue,
}) {
  showDialog(
    context: context,
    
    builder: (BuildContext context) {
      return Dialog(
        elevation: 2,
        
        insetPadding: EdgeInsets.all(25),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          
          borderRadius: BorderRadius.circular(16),
        ),
        child:FractionallySizedBox(
  heightFactor: 0.50,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: 
            
            Stack(
          
            children: [
          
          
          
              PositionedDirectional(
                end: 10, 
                top: 10 ,
                child: 
                Icon(
                  icon,
                ),
              
              
              )
            ],
            )
                
          ),
        ),
      );
    },
  );
}

// Example usage:
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom Alert Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showCustomAlert(
                context: context,
                title: 'Alert Title',
                content: 'This is dynamic content that can change based on your needs.',
                icon: Icons.info,
                iconColor: Colors.blue,
              );
            },
            child: const Text('Show Alert'),
          ),
        ),
      ),
    );
  }
}