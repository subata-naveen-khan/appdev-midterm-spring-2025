import 'package:equatable/equatable.dart';

abstract class ObjEvent extends Equatable {
  const ObjEvent();
}

class LoadObjsEvent extends ObjEvent {
  @override
  List<Object> get props => [];
}