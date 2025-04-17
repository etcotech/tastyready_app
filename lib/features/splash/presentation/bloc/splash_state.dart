import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  final bool isAutheticated;
  final bool isFirstTime;

  const SplashState({
    this.isAutheticated = false,
    this.isFirstTime = true,
  });
  
  SplashState copyWith({
    bool? isAutheticated,
    bool? isFirstTime,
  }) {
    return SplashState(
      isAutheticated: isAutheticated ?? this.isAutheticated,
      isFirstTime: isFirstTime ?? this.isFirstTime,
    );
  }
  @override 
  List<Object?> get props => [
        isAutheticated,
        isFirstTime,
      ];
}