import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tastyready_mobile/core/constants/strings.dart';
import 'package:tastyready_mobile/core/constants/translate.dart';
import 'package:tastyready_mobile/features/auth/domain/entities/country_entity.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:tastyready_mobile/features/auth/presentation/bloc/auth_state.dart';
import 'package:tastyready_mobile/features/auth/presentation/widgets/country_field.dart';

class CountriesView extends StatefulWidget {
  final CountryEntity? value;
  final Function(CountryEntity) onSelected;
  const CountriesView({super.key, this.value, required this.onSelected});

  @override
  State<CountriesView> createState() => _CountriesViewState();
}

class _CountriesViewState extends State<CountriesView> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
   context
        .read<AuthBloc>()
        .add(AuthLoadCountries());
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc ,AuthState>(builder: (context, state) {
      // if (state.isCountriesLoading) {
      //   return const Center(child: CircularProgressIndicator());
      // } 
      //  else if (state.error?.isNotEmpty ?? false) {
      //   return Center(child: Text(state.error!));
      // }  
      
      // else {
        return CountryField(
                hint:getTranslated(Strings.country, context),
          data:state.countries,
        value: widget.value,
        
          onSelected: (value) {
            setState(() {
              widget.onSelected(value!);
            });
          },
        );
      // }

    });
  }
}