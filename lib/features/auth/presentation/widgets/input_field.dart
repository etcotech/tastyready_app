import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
   final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final IconData? icon;
  final String? errorText;
  final Function(String?)? onSaved;

  const InputField({super.key, this.hint, this.controller,this.errorText, this.validator, this.icon, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return 
                  TextFormField(
                    onSaved: onSaved,
                    onTapOutside: (_){
                      FocusScope.of(context).unfocus();
                            FocusManager.instance.primaryFocus?.unfocus();
                    },
                    controller: controller,

                
                    decoration: InputDecoration(errorText: errorText,

                      filled: true, // Enables the fill color
fillColor: Colors.grey[100], // Sets the fill color
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      //   borderSide: BorderSide.none, // Removes the border
                      // ),

    border: InputBorder.none, // Removes the border
    enabledBorder: InputBorder.none, // Removes border when enabled
    // focusedBorder: InputBorder.none, 
                      hintText: hint,
                      hintStyle: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                      prefixIcon:  Icon(icon),
                      // suffixIcon: Icon(Icons.email_outlined, color: Colors.black54, size: 20,)
                      ),
                    
                    validator: validator
                  );
                 
  }
}