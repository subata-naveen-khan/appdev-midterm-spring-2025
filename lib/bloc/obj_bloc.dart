import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midterm_s2025/bloc/events.dart';
import 'package:midterm_s2025/bloc/states.dart';
import 'package:midterm_s2025/Obj/obj_repo.dart';

class ObjBloc extends Bloc<ObjEvent, ObjState> {
  final ObjRepo objRepo;

  ObjBloc({required this.objRepo}) : super(ObjInitial()) {
    on<LoadObjsEvent>(_onLoadObjs);
  }

  Future<void> _onLoadObjs (
    LoadObjsEvent event,
    Emitter<ObjState> emit,
  ) async {
    emit(ObjsLoading());
    try {
      final objs = await objRepo.fetchObjs();
      emit(ObjsLoaded(objs: objs));
    } catch (e) {
      emit(ObjError(message: e.toString()));
    }
  }
}