import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/country_entity.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_state.dart';

class CountryListAlert extends StatefulWidget {
  final List<CountryEntity> countries;
  final Function(CountryEntity) onCountrySelected;

  const CountryListAlert({
    super.key,
    required this.countries,
    required this.onCountrySelected,
  });

  @override
  _CountryListAlertState createState() => _CountryListAlertState();
}

class _CountryListAlertState extends State<CountryListAlert> {
  late List<CountryEntity> filteredCountries;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCountries = widget.countries;
    searchController.addListener(_filterCountries);

  }

  void _filterCountries() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredCountries = widget.countries
          .where((country) => country.name!.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(   height: MediaQuery.sizeOf(context).height * .80,
    width: MediaQuery.sizeOf(context).width ,
      child: Dialog(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: searchController,
              decoration:  InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount:filteredCountries.length,
                itemBuilder: (context, index) {
                  final country = filteredCountries[index];
                  return ListTile(
                    title: Text(country.name!),
                    onTap: () {
                      widget.onCountrySelected(country);
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      
      ),
    );
  }
}

// Usage Example:
// showDialog(
//   context: context,
//   builder: (context) => CountryListAlert(
//     countries: ['USA', 'Canada', 'India', 'Germany', 'France'],
//     onCountrySelected: (country) {
//       print('Selected Country: $country');
//     },
//   ),
// );