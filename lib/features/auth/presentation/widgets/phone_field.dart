import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneField extends StatelessWidget {
  final String? hint;
  final String? errorText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final  Function(PhoneNumber?)? onSaved;
  const PhoneField({super.key, this.hint, this.controller, this.validator, this.onSaved, this.errorText});

  @override
  Widget build(BuildContext context) {
    return 
    
    IntlPhoneField(
      
      controller: controller  ,
      onSaved:onSaved ,
    
    validator: (value) {
          return   validator!(value!.number);
            // return null;
          },
          
          decoration: InputDecoration(
            
errorText:  errorText ,

            hintStyle: const TextStyle(
              
              
              color: Colors.black54,
              fontSize: 14,
            ),
               filled: true, // Enables the fill color
        fillColor: Colors.grey[100], 
hintText: hint,
// helperText: '',
counterText: null,
counter: SizedBox(),
// errorText: '',


 contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
            border:InputBorder.none,
          ),
          initialCountryCode: 'SA', // Default country code
          onChanged: (phone) {
            // setState(() {
            //   completePhoneNumber = phone.completeNumber; // Full number with country code
            // });
          },

          onCountryChanged: (country) {
            print('Country changed to: ${country.name}');
          },
        );
    
    /*
    
    TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true, // Enables the fill color
        fillColor: Colors.grey[100], // Sets the fill color
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        border: InputBorder.none, // Removes the border
        enabledBorder: InputBorder.none, // Removes border when enabled
        // focusedBorder: InputBorder.none,
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.black54,
          fontSize: 14,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: DropdownButton<String>(
            value: '+1', // Default country code
            dropdownColor: Colors.white,
            items: <String>['+1', '+91', '+44', '+61'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,
                
                style: TextStyle(
                  color: Colors.black,
                  // fontSize: 14,
                )
                
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Handle country code selection
            },
            underline: Container(), // Removes the underline
          ),
        ),
      ),
      validator: validator,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        // Add any input formatters if needed
      ],
      onChanged: (value) {
        // Handle changes if needed
      },
      onFieldSubmitted: (value) {
        // Handle field submission if needed
      },
      onSaved: (value) {
        // Handle saving the value if needed
      },
    );
 
 */
 
 
  }
}