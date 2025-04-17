import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tastyready_mobile/core/constants/strings.dart';
import 'package:tastyready_mobile/core/constants/textstyles.dart';
import 'package:tastyready_mobile/core/constants/translate.dart';
import 'package:tastyready_mobile/core/utils/validators.dart';
import 'package:tastyready_mobile/core/widgets/continue_with_email_button.dart';
import 'package:tastyready_mobile/core/widgets/main_button.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_state.dart';
import 'package:tastyready_mobile/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:tastyready_mobile/features/auth/presentation/pages/regsiteration_page.dart';
import 'package:tastyready_mobile/features/auth/presentation/widgets/email_field.dart';
import 'package:tastyready_mobile/features/auth/presentation/widgets/password_field.dart';
import 'package:tastyready_mobile/features/auth/presentation/widgets/phone_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
   String _phoneNumber = '';


  @override
  void dispose() {
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<AuthBloc,AuthState>(
        builder: (context , state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 80),
                // App Logo/Title
               Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 20),
                // const Text(
                //   'Welcome Back',
                //   style: TextStyle(
                //     fontSize: 28,
                //     fontWeight: FontWeight.bold,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
                // const SizedBox(height: 10),
                 Text(
               getTranslated(Strings.loginToYourAccount, context)!,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
          
                // Login Form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email Field
                 PhoneField(
                    controller: _phoneNumberController,
                    onSaved: (value) {
                    // _phoneNumberController.text = value!.completeNumber;
                    _phoneNumber = value!.completeNumber;
                    },
                    hint:getTranslated(Strings.phoneNumber, context),
                    validator: (value){
                      var error=phoneNumberValidator(value);
                      if (error != null) {
                        return error;
                      }
                      // return null;
                      return state.phoneValidationError;
                    },
                  ),
                  
                      const SizedBox(height: 20),
          
                      // Password Field
          PasswordField(
            controller: _passwordController,
            
            hint: getTranslated(Strings.password, context),
            onSaved: (value) {
                      _passwordController.text = value!;
                    },
                    errorText: state.passwordValidationError,
          validator: (value){
                      var error=passwordValidator(value);
                      if (error != null) {
                        return error;
                      }
                  
                      return state.passwordValidationError;
                    },
                    
          ),
                     
                     
                      const SizedBox(height: 10),
          
                      // Forgot Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: (){
          
          Navigator.push(context, 
          
          PageTransition(type: 
          
          PageTransitionType.leftToRight, 
          child: ForgotPasswordPage()
          )
          );
          
          
          
          
          
                          },
                          child:  Text(getTranslated(Strings.forgotPassword, context)!),
                        ),
                      ),
                      const SizedBox(height: 20),
          
          
                      // Login Button
          MainButton(
            text: getTranslated(Strings.login, context),
            // onPressed: _isLoading ? null : _login,
            onPressed: (){
          _login();
          
          //     Navigator.push(context,
          // PageTransition(
          //   type: PageTransitionType.leftToRight,
          //   child:  DashboardPage(),
          // ),
          //     );
          /*
              showAnimatedSnackBar(
                          context,
                          message: 'Login Failed!',
                          isSuccess: false,
                        );
          
          
                        */
            },
            isLoading: state.isLoading,
            textColor: Colors.white,
            
          )
                   
                   
                    ],
                  ),
                ),


                /*
                const SizedBox(height: 30),
          
                // Or Divider
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('OR'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 30),
          
              LoginOptionButton(
                icon: Icons.email_outlined,
                text: "Continue with Email",
onPressed: () { 

  context.read<AuthBloc>().add(
    ChangeLoginViewEvent(false)
  );
  
  },
              ),
                */
                const SizedBox(height: 30),
          
                // Sign Up Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text( getTranslated("you_did_not_have_an_account", context)!),
                    TextButton(
                      onPressed: () {
          
                        
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegistrationPage(),
                          ),
                        );
                      },
                    
                      child:  Text(getTranslated(Strings.register, context)!),
                    ),
                  ],
                ),
          
                Text(
            getTranslated("by_signing_in", context)!,
            style: AppTextStyles.bodyText2,
            textAlign: TextAlign.center,
          )
              ],
            ),
          );
        }
      ),
    );
  }

  Future<void> _login() async {
    context.read<AuthBloc>()
        .add(SinupFormClearErros());
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Perform login action
  context.read<AuthBloc>()
        .add(LoginPhoneChanged(
          _phoneNumber,
        ));
          context.read<AuthBloc>()
        .add(LoginPasswordChanged(
          _passwordController.text,
        ));

        
       context.read<AuthBloc>()
       
        .add(LoginSubmitted(context: context));
    }
  }

}

// Your existing RegistrationPage class would be here