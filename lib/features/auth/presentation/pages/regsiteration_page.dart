
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tastyready_mobile/core/constants/strings.dart';
import 'package:tastyready_mobile/core/constants/textstyles.dart';
import 'package:tastyready_mobile/core/constants/translate.dart';
import 'package:tastyready_mobile/core/utils/validators.dart';
import 'package:tastyready_mobile/core/widgets/main_button.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/city_entity.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/country_entity.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_state.dart';
import 'package:tastyready_mobile/features/auth/presentation/pages/login_page.dart';
import 'package:tastyready_mobile/features/auth/presentation/views/cities_view.dart';
import 'package:tastyready_mobile/features/auth/presentation/views/countries_view.dart';
import 'package:tastyready_mobile/features/auth/presentation/views/select_country_view.dart';
import 'package:tastyready_mobile/features/auth/presentation/widgets/country_countainer.dart';
import 'package:tastyready_mobile/features/auth/presentation/widgets/email_field.dart';
import 'package:tastyready_mobile/features/auth/presentation/widgets/input_field.dart';
import 'package:tastyready_mobile/features/auth/presentation/widgets/password_field.dart';
import 'package:tastyready_mobile/features/auth/presentation/widgets/phone_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  // final _phoneController = TextEditingController();
  // final _countryController = TextEditingController();
  // final _cityController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  // final _countryIdController = TextEditingController();

  // Form fields
  // final String _firstName = '';
  // final String _lastName = '';
  // final String _email = '';
  // final String _password = '';
  // final String _confirmPassword = '';
   String _phoneNumber = '';
  CountryEntity? _selectedCountry;
  CityEntity? _selectedCity;

  // Sample data for dropdowns




   @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
           context.read<AuthBloc>()
        .add(SinupFormClearErros(
        )
        );
   context
        .read<AuthBloc>()
        .add(AuthLoadCountries());
    });
  }


  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:  Text(getTranslated("registeration", context)!),
      ),
      body: BlocBuilder<AuthBloc,AuthState>(
        builder: (context , state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .05,
                  ),
                  // First Name
                  InputField(
                    controller: _firstNameController,
                    onSaved: (value) {
                      _firstNameController.text = value!;
                    },
                    
                    hint: getTranslated(Strings.firstName, context),
                    icon: Icons.person,
                    errorText: state.nameValidationError,
                    validator: (value){
                      var error=requiredFieldValidation(value);
                      if (error != null) {
                        return error;
                      }
                      return null;
                    },
                  ),
                  
                  const SizedBox(height: 16),
          
                  // Last Name
                 InputField(
                    controller: _lastNameController,
                    onSaved: (value) {
                      _lastNameController.text = value!;
                    },
                    hint: getTranslated(Strings.lastName, context),
                    icon: Icons.person,
                  errorText: state.nameValidationError,
                    validator: (value){
                      var error=requiredFieldValidation(value);
                      if (error != null) {
                        return error;
                      }
                      return state.nameValidationError;
                    },
                 ),
                  const SizedBox(height: 16),
          
                  // Email
                 EmailField(
                    controller:_emailController,
                    onSave: (value) {
                      _emailController.text = value!;
                    },
                    errorText: state.emailValidationError,
                    hint: getTranslated(Strings.email, context),
                    validator: (value){
                      var error=emailValidator(value);
                      if (error != null) {
                        return error;
                      }
                  
                      return state.emailValidationError;
                    },
                 ),
           
               
                  const SizedBox(height: 16),
          
                  // Phone Number
                 PhoneField(
                    controller: _phoneNumberController,
                    onSaved: (value) {
                    // _phoneNumberController.text = value!.completeNumber;
                    _phoneNumber = value!.completeNumber;
                    },
                    hint:getTranslated(Strings.phoneNumber, context),
                    errorText: state.phoneValidationError,
                    validator: (value){
                      var error=phoneNumberValidator(value);
                      if (error != null) {
                        return error;
                      }
                      // return null;
                      return state.phoneValidationError;
                    },
                  ),
                  
                  const SizedBox(height: 16),
          
                  // Country Dropdown
          // CountriesView(onSelected: (value){
          //   setState(() {
          //               _selectedCountry = value;
          //               _selectedCity=null;
          //               // citiesByCountry
                       
          //             });
          // }, 
          
          // value: _selectedCountry,
          
          
          // ),
          CountryCountainer(
            hint: getTranslated(Strings.country, context),
            title: 
                 _selectedCountry?.name
               ,
onTap: (){

FocusScope.of(context).unfocus();
                            FocusManager.instance.primaryFocus?.unfocus();
Navigator.push(context, 
MaterialPageRoute(builder: (_)=> SelectCountryView(
  countries: state.countries,
onCountrySelected: (country){
  setState(() {
    _selectedCountry = country;
    _selectedCity = null;
  });
},

))


);

},
          )
          ,
          
       
             _selectedCountry!=null?     const SizedBox(height: 16)  : const SizedBox(),
          

_selectedCountry!=null?  // City Dropdown
               CountryCountainer(
            hint: getTranslated(Strings.city, context),
            title:  _selectedCity?.name, 
            icon: Icons.location_city,
                
onTap: (){
FocusScope.of(context).unfocus();
                            FocusManager.instance.primaryFocus?.unfocus();
Navigator.push(context,
MaterialPageRoute(builder: (_)=> CitiesView(
  countryId: _selectedCountry?.id.toString() ?? '',
  onSelected: (city){
    setState(() {
      _selectedCity = city;
    });
  },
  
))
);


},
          ):SizedBox(),
          
          
                         const SizedBox(height: 16),
          
                  // Password
                  PasswordField(
                    
                    hint: getTranslated(Strings.password, context),
                    controller: _passwordController,
                    errorText: state.passwordValidationError,
                    onSaved: (value) {
                      _passwordController.text = value!;
                    },
                    validator: (value){
                      var error=passwordValidator(value);
                      if (error != null) {
                        return error;
                      }
                      // return null;
                      return state.passwordValidationError;
                    },
                  ),
                 
                  const SizedBox(height: 16),
          
                  // Confirm Password
          PasswordField(

controller: _passwordConfirmController,
                    onSaved: (value) {
                      _passwordConfirmController.text = value!;
                    },
                    errorText: state.passwordValidationError,


                    hint: getTranslated(Strings.confirmPassword, context),
                    validator: (value) {
                      var error=confirmPasswordValidator(value, _passwordController.text);
                      if (error != null) {
                        return error;
                      }
                      // return null;
                      return state.passwordValidationError;
                    },
                  ),
                  const SizedBox(height: 24),
          
                  // Submit Button
          
       
              
              
               MainButton(
          isLoading: state.isLoading,
                        text: getTranslated(Strings.register, context),
                        
                        onPressed: (){
          
          
                          /*
              showDialog(
          context: context,
          builder: (context) => CountryListAlert(
            countries:(state as AuthCountriesLoaded).countries,
            onCountrySelected: (country) {
              print('Selected Country: $country');
            },
          ),
              );
              */
                          _submitForm();
                        },
                        color: Theme.of(context).primaryColor,
                        
                      ),
           
           
                  const SizedBox(height: 16),
          
                  // Already have an account? Login
          
           Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(getTranslated("do_you_have_an_account", context)!),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  LoginPage(),
                          ),
                        );
                      },
                      child:  Text(getTranslated(Strings.login, context)!),
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
            ),
          );
        }
      ),
    );
  }

  void _submitForm() {
     context.read<AuthBloc>()
        .add(SinupFormClearErros(
        )
        );
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

 context.read<AuthBloc>()
        .add(SignupNameChanged(
          "${_firstNameController.text} ${_lastNameController.text}",
        )
        );

context.read<AuthBloc>()
        .add(SignupEmailChanged(
          _emailController.text.trim(),
        
        )
        );
context.read<AuthBloc>()
        .add(SignupPhoneChanged(
_phoneNumber.trim(),        
        )
        );
context.read<AuthBloc>()
        .add(SignupPasswordChanged(
          _passwordController.text.trim(),
        )
        );
// context.read<AuthBloc>()
//         .add(SignupConfirmPasswordChanged(
//           _passwordConfirmController.text.trim(),
//         )
//         );
context.read<AuthBloc>()
        .add(SignupCountryIdChanged(
          _selectedCountry?.id.toString() ?? '',
        )
        );
context.read<AuthBloc>()
        .add(SignupCityIdChanged(
          _selectedCity?.id.toString() ?? '',
        )
        );




       context
        .read<AuthBloc>()
        .add(SignupFormSubmitted(
          context
          // name: "${_firstNameController.text} ${_lastNameController.text}",
          // email: _emailController.text.trim(),
          // password: _passwordController.text.trim(),
          // phone: _phoneNumber,
          // countryId: _selectedCountry?.id.toString() ?? '',
          // cityId: _selectedCity?.id.toString() ?? '',
          // appSecret: "Test_app_srcret_Test321543223"
        ));
    
     
    
    
    }
  }
}