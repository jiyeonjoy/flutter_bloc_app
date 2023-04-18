import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/blocs/root/root_bloc.dart';
import 'package:flutter_bloc_app/common/config/configure.dart';
import 'package:flutter_bloc_app/common/config/r.dart';
import 'package:flutter_bloc_app/pages/home/home_page.dart';
import 'package:flutter_bloc_app/pages/my/my_page.dart';

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

  final RootBloc _rootBloc = RootBloc();

  @override
  void dispose() {
    _rootBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.white,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return StreamBuilder<RootTab>(
      stream: _rootBloc.getRootTabStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Expanded(
                  child: _buildTabView(snapshot.data!)
              ),
              _buildNavbar(snapshot.data!)
            ],
          );
        } else {
          return Container(
            width: R.dimenInfinite,
            height: R.dimenInfinite,
            color: R.color.white,
          );
        }
      },
    );
  }

  Widget _buildTabView(RootTab selectedTab) {
    switch (selectedTab) {
      case RootTab.home:
        return const HomePage();
      case RootTab.my:
        return const MyPage();
    }
  }

  Widget _buildNavbar(RootTab selectedTab) {
    return SafeArea(
      top: false,
      child: SizedBox(
        width: R.dimenInfinite,
        height: R.dimen[56],
        child: Row(
          children: [
            _buildNavbarButton(
                RootTab.home,
                selectedTab == RootTab.home
            ),
            _buildNavbarButton(
                RootTab.my,
                selectedTab == RootTab.my
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavbarButton(RootTab rootTab, bool isSelected) {
    return Expanded(
        child: GestureDetector(
          onTap: () {
            _rootBloc.selectTab(rootTab);
          },
          child: Container(
            color: R.color.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isSelected ? rootTab.selectedIcon : rootTab.icon,
                SizedBox(height: R.dimen[2]),
                Text(
                  rootTab.text,
                  style: isSelected
                      ? textStyle600(Colors.black, 12)
                      : textStyleMedium(Colors.black26, 12),
                )
              ],
            ),
          ),
        )
    );
  }
}
