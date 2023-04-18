import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_app/common/config/r.dart';

class BLoCApp extends StatefulWidget {
  const BLoCApp({Key? key}) : super(key: key);

  @override
  State<BLoCApp> createState() => _BLoCAppState();
}

class _BLoCAppState extends State<BLoCApp> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    /// 세로 모드 고정
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  bool initMediaQuery = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        if(!initMediaQuery) {
          final mediaQuery = MediaQuery.of(context);
          initMediaQuery = true;
          R.initDimen(mediaQuery.size.width, mediaQuery.size.height, mediaQuery.devicePixelRatio);
        }
        return const SplashPage();
      }),
    );
  }
}
