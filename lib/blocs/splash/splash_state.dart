import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class InitialSplash extends SplashState {
  @override
  String toString() => 'InitialSplash';
}
