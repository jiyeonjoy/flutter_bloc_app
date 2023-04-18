import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/blocs/root/root_event.dart';
import 'package:flutter_bloc_app/blocs/root/root_state.dart';
import 'package:flutter_bloc_app/common/config/r.dart';
import 'package:rxdart/rxdart.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  RootBloc() : super(InitialRoot());

  final _rootTabState = BehaviorSubject<RootTab>()..sink.add(RootTab.home);
  Stream<RootTab> get getRootTabStream => _rootTabState.stream;

  void selectTab(RootTab selectTab) {
    _rootTabState.sink.add(selectTab);
  }

  @override
  Future<void> close() {
    _rootTabState.close();
    return super.close();
  }
}

enum RootTab {
  home,
  my,
}

extension RootTabExt on RootTab {
  Icon get icon {
    switch (this) {
      case RootTab.home:
        return const Icon(Icons.home_outlined, color: Colors.black26,);
      case RootTab.my:
        return const Icon(Icons.person_outline, color: Colors.black26,);
    }
  }

  Icon get selectedIcon {
    switch (this) {
      case RootTab.home:
        return const Icon(Icons.home);
      case RootTab.my:
        return const Icon(Icons.person);
    }
  }

  String get text {
    switch (this) {
      case RootTab.home:
        return R.string.home;
      case RootTab.my:
        return R.string.my;
    }
  }
}
