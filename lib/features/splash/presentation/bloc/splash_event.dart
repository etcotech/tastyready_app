abstract class SplashEvent {}

class CheckLoginStatus extends SplashEvent {}

class CheckingFirstTime extends SplashEvent {}
class LoadAppSettings extends SplashEvent {}

class UpdateirstTime extends SplashEvent {
  final bool isFirstTime;

  UpdateirstTime(this.isFirstTime);
}
