import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tastyready_mobile/core/constants/strings.dart';
import 'package:tastyready_mobile/core/constants/translate.dart';
import 'package:tastyready_mobile/core/utils/validators.dart';
import 'package:tastyready_mobile/core/widgets/main_button.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_state.dart';
import 'package:tastyready_mobile/features/auth/presentation/views/login_view.dart';
import 'package:tastyready_mobile/features/auth/presentation/widgets/email_field.dart';
import 'package:tastyready_mobile/features/auth/presentation/widgets/phone_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;
final _phoneNumberController = TextEditingController();
   String _phoneNumber = '';
  // Mock function to simulate password reset request
  Future<void> _resetPassword(String email) async {
    setState(() {
      _isLoading = true;
    });
    // Simulate API call (e.g., Firebase Auth)
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Password reset email sent to $email')),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: BlocBuilder<AuthBloc ,AuthState>(
        builder: (context , state) {

          if (state.isOtpDone) {
            return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Success!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Your action was completed successfully.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigate to Login Screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: TextStyle(fontSize: 16),
              ),
              child: Text('Go to Login'),
            ),
          ],
        ),
      );
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                   getTranslated("enter_phone_to_send_code", context)!,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
          /*
          EmailField(
            onSave: (value) {
                      _emailController.text = value!;
                    },
                    hint: getTranslated(Strings.email, context),
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Add more validation if needed
                      return null;
                    },
          ), 
           */     
 PhoneField(
  
                    controller: _phoneNumberController,
                    onSaved: (value) {
                    // _phoneNumberController.text = value!.completeNumber;
                    _phoneNumber = value!.completeNumber;
                  setState(() {
                    
                  });
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
                MainButton(
                  
                  text: getTranslated("send_code", context),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

context.read<AuthBloc>() 
.add(
  PasswordResetEvent(
    _phoneNumber,
  )
);





                    }
                  },
                  isLoading: state.isLoading,
                ),
                //   const SizedBox(height: 20),
                //   TextButton(
                //     onPressed: () {
                //       Navigator.pop(context);
                //     },
                //     child: const Text('Back to Login'),
                // )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}