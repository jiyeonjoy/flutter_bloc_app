import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/common/config/configure.dart';
import 'package:flutter_bloc_app/common/config/r.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();

  static Future<dynamic> navigatorPush(BuildContext context,
      {PushOption pushOption = PushOption.replace}) async {
    return configurePush(context, (context) => const RootPage(),
        pushOption: pushOption);
  }
}

class _RootPageState extends State<RootPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.white,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return const Center(
      child: Text(
          'Root Page'
      ),
    );
  }
}
