import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/country_entity.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_state.dart';

class SelectCountryView extends StatefulWidget {
  final List<CountryEntity>? countries;
  final Function(CountryEntity)? onCountrySelected;

  const SelectCountryView({super.key, this.onCountrySelected, this.countries});

  @override
  State<SelectCountryView> createState() => _SelectCountryViewState();
}

class _SelectCountryViewState extends State<SelectCountryView> {
  final _searchController = TextEditingController();
  var _countries = <CountryEntity>[];
  var _filteredCountries = <CountryEntity>[];


    @override
  void initState() {
    super.initState();
    _countries = widget.countries ?? [];
    _filteredCountries = _countries;
_searchController.addListener(() {
      setState(() {
        _filteredCountries = _countries
            .where((country) => country.name!
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()))
            .toList();
      });
    });
  
   
  }
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.isLoading) {
      return    Scaffold(
          appBar: AppBar(
           leading: IconButton(
              icon: const Icon(Icons.close,  size: 32,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
         
          ),
          body:
          const Center(
            child: CircularProgressIndicator(),
          ),
        );
        } 
        
        else if (state.error!.isNotEmpty) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon:  Icon(Icons.close,  size: 32,
                
                
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Center(
              child: Text(state.error!),
            ),
          );
        } 

        return Scaffold(
          appBar: AppBar(
           leading: IconButton(
              icon:  Icon(Icons.close,  size: 32,
              
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
         
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchController,
                
                  onChanged: (value) {
                    setState(() {
                      _filteredCountries = _countries
                          .where((country) => country.name!
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search',

                    border: InputBorder.none  ,
                    filled: true,
                    fillColor: Colors.grey[100],
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredCountries.length,
                  itemBuilder: (context, index) {
                    final country = _filteredCountries[index];
                    return ListTile(
                      title: Text(country.name!),
                      onTap: () {
                        widget.onCountrySelected?.call(country);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}