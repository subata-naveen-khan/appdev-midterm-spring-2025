import 'package:midterm_s2025/Obj/obj_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ObjRepo {
  final String baseUrl = 'https://api.spacexdata.com/v3/missions';

  Future<List<ObjModel>> fetchObjs() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final List decodedJson = jsonDecode(response.body);
        return decodedJson
            .map<ObjModel>((json) => ObjModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load objs');
      }
    } catch (e) {
      throw Exception('Error fetching objs: $e');
    }
  }
}