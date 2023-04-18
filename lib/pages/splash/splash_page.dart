import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/blocs/splash/splash_bloc.dart';
import 'package:flutter_bloc_app/common/config/r.dart';
import 'package:flutter_bloc_app/pages/root/root_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  late SplashBloc _splashBloc;

  @override
  void initState() {
    super.initState();
    _splashBloc = SplashBloc(() {
      RootPage.navigatorPush(context);
    })..launch();
  }

  @override
  void dispose() {
    _splashBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SizedBox(
      width: R.dimenInfinite,
      height: R.dimenInfinite,
      child: const Center(
          child: Text(
            'Splash Page'
          ),
      ),
    );
  }
}
