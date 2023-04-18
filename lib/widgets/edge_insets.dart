import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/common/config/r.dart';

EdgeInsetsGeometry edgeInsetsDimen({double? all, double? vertical, double? horizontal, double? start, double? top, double? end, double? bottom}) =>
    EdgeInsetsDirectional.only(
      start: _edgeInsetsDimen(start, horizontal, all),
      end: _edgeInsetsDimen(end, horizontal, all),
      top: _edgeInsetsDimen(top, vertical, all),
      bottom: _edgeInsetsDimen(bottom, vertical, all),
    );

double _edgeInsetsDimen(double? only, double? symmetric, double? all) {
  if(only != null) {
    return R.dimen[only]!;
  } else if(symmetric != null) {
    return R.dimen[symmetric]!;
  } else if(all != null) {
    return R.dimen[all]!;
  } else {
    return 0;
  }
}

class HSpace extends StatelessWidget {
  final double width;

  const HSpace(this.width, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(width: R.dimen[width]);
}

class VSpace extends StatelessWidget {
  final double height;

  const VSpace(this.height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(height: R.dimen[height]);
}
