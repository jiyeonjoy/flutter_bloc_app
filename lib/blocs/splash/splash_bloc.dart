import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/blocs/splash/splash_event.dart';
import 'package:flutter_bloc_app/blocs/splash/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {

  final Function() onRootPage;

  SplashBloc(this.onRootPage) : super(InitialSplash());

  void launch() async {
    await waitMilliseconds(1000);
    onRootPage();
  }

  Future<void> waitMilliseconds(int milliseconds) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
  }
}
