import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RootEvent extends Equatable {
  const RootEvent();

  @override
  List<Object> get props => [];
}

class InitRoot extends RootEvent {
  @override
  String toString() => 'InitRoot';
}
