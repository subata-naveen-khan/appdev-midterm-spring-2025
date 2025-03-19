import 'package:equatable/equatable.dart';

class ObjModel extends Equatable {
  final String obj;
  final String? name;

  const ObjModel({
    required this.obj,
    required this.name,
  });

  factory ObjModel.fromJson(Map<String, dynamic> json) {
    return ObjModel(
      obj: json['obj'] ?? '',
      name: json['name'],
    );
  }

  @override
  List<Object?> get props => [obj, name];
}