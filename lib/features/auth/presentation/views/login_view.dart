import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_state.dart';
import 'package:tastyready_mobile/features/auth/presentation/pages/login_page.dart';
import 'package:tastyready_mobile/features/auth/presentation/pages/login_with_email_page.dart';

class LoginView extends StatelessWidget {

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc,AuthState>(

      builder: (context, state) {



if (state.isPhoneLogin) {
return LoginPage();
}
else{
return LoginWithEmailPage();
}
  

  
  });
  }
}