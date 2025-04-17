import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tastyready_mobile/core/constants/textstyles.dart';
import 'package:tastyready_mobile/core/constants/translate.dart';
import 'package:tastyready_mobile/core/utils/extenstions/phone_extension.dart';
import 'package:tastyready_mobile/core/widgets/main_button.dart';
import 'package:tastyready_mobile/core/widgets/toasts.dart';
import 'package:tastyready_mobile/features/auth/presentation/views/login_view.dart';
import 'package:tastyready_mobile/features/home/presentation/home_page.dart';

class PhoneVerificationPage extends StatefulWidget {
  final String phoneNumber;
  const PhoneVerificationPage({super.key, required this.phoneNumber});

  @override
  State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final String _verificationId = '';
  final bool _isOtpSent = false;
  String _statusMessage = '';
final List<TextEditingController> _controllers =
      List.generate(5, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(5, (_) => FocusNode());

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }
  // Send OTP to the provided phone number
  Future<void> _sendOtp() async {
    String phoneNumber = _phoneController.text.trim();
    // Ensure phone number includes country code (e.g., +91 for India)
    if (!phoneNumber.startsWith('+')) {
      phoneNumber = '+91$phoneNumber'; // Adjust country code as needed
    }

    if (phoneNumber.length < 12 || !RegExp(r'^\+\d{10,15}$').hasMatch(phoneNumber)) {
      setState(() {
        _statusMessage = 'Please enter a valid phone number';
      });
      return;
    }

    setState(() {
      _statusMessage = 'Sending OTP...';
    });
/*
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieval or instant verification (Android only)
        await _auth.signInWithCredential(credential);
        setState(() {
          _statusMessage = 'Phone number verified automatically!';
        });
        _navigateToHome();
      },
      verificationFailed: (FirebaseAuthException e) {
        setState(() {
          _statusMessage = 'Error: ${e.message}';
        });
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId;
          _isOtpSent = true;
          _statusMessage = 'OTP sent to $phoneNumber';
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationId = verificationId;
        });
      },
      timeout: const Duration(seconds: 60),
    );
  
  */
  }

  // Verify the OTP entered by the user
  Future<void> _verifyOtp() async {
    String smsCode = _otpController.text.trim();

    if (smsCode.length != 6) {
      setState(() {
        _statusMessage = 'Please enter a valid 6-digit OTP';
      });
      return;
    }

    setState(() {
      _statusMessage = 'Verifying OTP...';
    });
/*
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
      setState(() {
        _statusMessage = 'Phone number verified successfully!';
      });
      _navigateToHome();
    } catch (e) {
      setState(() {
        _statusMessage = 'Error verifying OTP: $e';
      });
    }

    */
  }

  // Navigate to the home page after successful verification
  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }
void _onChanged(String value, int index) {
    if (value.length == 1 && index < 4) {
      _focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
    
    String otp = _controllers.map((controller) => controller.text).join();
    if (otp.length == 5) {
//verify otp
      // _verifyOtp();
showAnimatedSnackBar(context, isSuccess: true , 

message: 'Phone Verified Successfully'
      //go to home page
);
Navigator.pushAndRemoveUntil(context, 

MaterialPageRoute(builder: (_)=> 
LoginView()
), 
(route)=> false
);




    }

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:  Text(getTranslated("verify_account",context, )!),
      ),
        
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text(
            "${getTranslated("please_enter_code_we_sent_to_your_phone_number", context)!} "            
            
            ,
            style: AppTextStyles.bodyText2,
            textAlign: TextAlign.center,
          ),
          Text(
            widget.phoneNumber.hidePhoneNumber(),
            style: AppTextStyles.bodyText2.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24),


            
Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(5, (index) {
        return SizedBox(
          width: 50,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onChanged: (value) => _onChanged(value, index),
          ),
        );
      }),
    ),
              const SizedBox(height: 24),
              MainButton(
                isLoading: false,
                onPressed: (){
                //  showCustomSnackBar(context, "OTP Sent", isError: false);

                //go to login 
                

                },
                text:
                'Verify OTP',
              ),
            
            const SizedBox(height: 16),
            Text(
              _statusMessage,
              style: TextStyle(
                color: _statusMessage.contains('Error') ? Colors.red : Colors.green,
              ),
            ),
            const SizedBox(height: 16),
          ]
        ),
      ),
    );
  }


}

// Placeholder for the HomePage
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Welcome! Phone Verified.')),
    );
  }
}