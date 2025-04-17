import 'package:flutter/material.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/country_entity.dart';

class CountryCountainer extends StatelessWidget {
  final String? hint;
  final Function()? onTap;
  final String? title;
  final IconData? icon;

  const CountryCountainer({super.key, this.hint, this.onTap, this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container
        (
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                 Icon(icon ?? Icons.flag, ),
                const SizedBox(width: 10),
                Text(
                  title ?? hint!,
                  style:  TextStyle(
                    fontSize: 14,
                    color: 
                    title !=null?
Colors.black:
                    
                     Colors.black54,
                  ),
                ),
              ],
            ),
           
            const Icon(Icons.arrow_drop_down), 
           
          ],
        ),
      ),
    );
  }
}