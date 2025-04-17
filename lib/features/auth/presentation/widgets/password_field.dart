import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final  Function(String?)? onSaved;
  final String? Function(String?)? validator;
final String? errorText;

  const PasswordField({super.key, this.hint, this.controller, this.validator, this.onSaved, this.errorText});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
    bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return 
                  
                  TextFormField(
                    onSaved: widget.onSaved,
                      onTapOutside: (_){
                            FocusManager.instance.primaryFocus?.unfocus();
                    },
                    controller: widget.controller,
                    decoration: InputDecoration(
                      errorText: widget.errorText,

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
                      hintText: widget.hint,
                      hintStyle: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    obscureText: _obscurePassword,
                    validator: widget.validator,
                  );
                 
  }
}