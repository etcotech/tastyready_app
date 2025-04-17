import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
   final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final  Function (String?) onSave;
  final String? errorText;
  const EmailField({super.key, this.hint, this.controller, this.validator, required this.onSave, this.errorText});
 
  @override
  Widget build(BuildContext context) {
    return 
                  TextFormField(
                    controller: controller,
                    onSaved: onSave ,
                      onTapOutside: (_){
                            FocusManager.instance.primaryFocus?.unfocus();
                    },
                    decoration: InputDecoration(
errorText: errorText,
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
    // border: OutlineInputBorder(
    //                         borderSide: BorderSide.none,
    //                         borderRadius: BorderRadius.all(Radius.circular(18)),
    //                       ),
    border: InputBorder.none, // Removes the border
    enabledBorder: InputBorder.none, // Removes border when enabled
    // focusedBorder: InputBorder.none, 
                      hintText: hint,
                      hintStyle: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                      prefixIcon: const Icon(Icons.email),
                      // suffixIcon: Icon(Icons.email_outlined, color: Colors.black54, size: 20,)
                      ),
                    
                    validator: validator
                  );
                 
  }
}