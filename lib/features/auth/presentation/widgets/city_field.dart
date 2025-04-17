import 'package:flutter/material.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/country_entity.dart';

class CityField extends StatefulWidget {
final String? hint;
final Function(Cities?)? onSelected; 
final bool? isCountry;
final Cities? value;
final List<Cities>? data;


   const CityField({super.key, 
  this.hint, this.onSelected, 
  this.isCountry=false, this.value , this.data});

  @override
  State<CityField> createState() => _CountryFieldState();
}

class _CountryFieldState extends State<CityField> {

 
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
 
 
  @override
  Widget build(BuildContext context) {
    return 
              DropdownButtonFormField<Cities>(

                decoration:  InputDecoration(

                  hintText: widget.hint,
                  prefixIcon: Icon(Icons.map),
                
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
    focusedBorder: InputBorder.none, 
                      hintStyle: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                ),
                // value: widget.value,
                items: 
                
                
                
                (widget.data )!.map((country) {
                  return DropdownMenuItem<Cities>(
                    value: country,
                    child: Text(
                      country.name!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        // fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null ) {
                    return 'Please select a country';
                  }
                  return null;
                },
                onChanged: (value) {
                 widget.onSelected!(value);
                 
                },
              );

             
  }
}