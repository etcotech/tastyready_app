import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tastyready_mobile/core/constants/strings.dart';
import 'package:tastyready_mobile/core/constants/translate.dart';
import 'package:tastyready_mobile/features/auth/data/models/city_model.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/city_entity.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/country_entity.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_state.dart';
import 'package:tastyready_mobile/features/auth/presentation/views/select_city_view.dart';
import 'package:tastyready_mobile/features/auth/presentation/widgets/city_field.dart';
import 'package:tastyready_mobile/features/auth/presentation/widgets/country_field.dart';

class CitiesView extends StatefulWidget {
  final String? label;
  final String? countryId;
  final Function(CityEntity)? onSelected;

  const CitiesView({super.key, required this.onSelected, this.label, this.countryId});

  @override
  State<CitiesView> createState() => _CountriesViewState();
}

class _CountriesViewState extends State<CitiesView> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
   context
        .read<AuthBloc>()
        .add(AuthLoadCities(widget.countryId!));
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc ,AuthState>(builder: (context, state) {
      if (state.isCitiesLoading) {
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
        }   else {
return SelectCityView(
  cities: state.cities,
  onCitySelected: widget.onSelected,
);

    
      }

    });
  }
}