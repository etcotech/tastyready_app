import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/city_entity.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/country_entity.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_state.dart';

class SelectCityView extends StatefulWidget {
  final List<CityEntity>? cities;
  final Function(CityEntity)? onCitySelected;

  const SelectCityView({super.key, this.onCitySelected, this.cities});

  @override
  State<SelectCityView> createState() => _SelectCountryViewState();
}

class _SelectCountryViewState extends State<SelectCityView> {
  final _searchController = TextEditingController();
  var _cities = <CityEntity>[];
  var _filteredCities = <CityEntity>[];


    @override
  void initState() {
    super.initState();
    _cities = widget.cities ?? [];
    _filteredCities = _cities;
_searchController.addListener(() {
      setState(() {
        _filteredCities = _cities
            .where((city) => city.name!
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
                      _filteredCities = _cities
                          .where((city) => city.name!
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
                  itemCount: _filteredCities.length,
                  itemBuilder: (context, index) {
                    final city = _filteredCities[index];
                    return ListTile(
                      title: Text(city.name!),
                      onTap: () {
                        widget.onCitySelected?.call(city);
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