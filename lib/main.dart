import 'package:flutter/material.dart';
import 'package:tastyready_mobile/app.dart';
import 'di.dart' as di;
void main() async{

  WidgetsFlutterBinding.ensureInitialized();


try {
await   di.init();
} catch (e) {
  
}

  
  runApp(const App());
}
var navigatorKey = GlobalKey<NavigatorState>();
