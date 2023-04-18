import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RootState extends Equatable {
  const RootState();

  @override
  List<Object> get props => [];
}

class InitialRoot extends RootState {
  @override
  String toString() => 'InitialRoot';
}
