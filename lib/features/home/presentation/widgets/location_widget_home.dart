import 'package:flutter/material.dart';

class LocationWidgetHome extends StatefulWidget {
  const LocationWidgetHome({super.key});

  @override
  State<LocationWidgetHome> createState() => _LocationWidgetHomeState();
}

class _LocationWidgetHomeState extends State<LocationWidgetHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),

      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Row(
          spacing: 16,
          mainAxisSize: MainAxisSize.min , 
          children: [
            Container(
              padding: const EdgeInsets.all( 10),
              // height: 50,
              // width: 50,
              decoration: BoxDecoration(
                // color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              child: const Icon(
                Icons.location_on_outlined,
                color: Colors.green,
                size: 20,
              ),
            ),
        
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'New York, USA',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
        
        
        
          ],
        ),
      ),
    );
  }
}