import 'package:equatable/equatable.dart';
import 'package:midterm_s2025/Obj/obj_model.dart';

abstract class ObjState extends Equatable {
  const ObjState();
}

class ObjInitial extends ObjState {
  @override
  List<Object> get props => [];
}

class ObjsLoading extends ObjState {
  @override
  List<Object> get props => [];
}


class ObjsLoaded extends ObjState {
  final List<ObjModel> objs;

  const ObjsLoaded({required this.objs});

  @override
  List<Object> get props => [objs];
}

class ObjError extends ObjState {
  final String message;

  const ObjError({required this.message});

  @override
  List<Object> get props => [message];
}