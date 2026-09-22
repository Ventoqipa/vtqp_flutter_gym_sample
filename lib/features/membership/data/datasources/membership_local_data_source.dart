import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:vtqp_flutter_gym_sample/features/membership/data/models/membership_model.dart';

abstract class MembershipLocalDataSource {
  Future<MembershipModel> getMembership();
}

class MembershipLocalDataSourceImpl implements MembershipLocalDataSource {
@override
Future<MembershipModel> getMembership() async {
  // 1. Lee el archivo desde assets
  final String response = await rootBundle.loadString('assets/mocks/subscription.json');

  // 2. Decodifica el JSON indicando el tipo explícito
  final Map<String, dynamic> jsonMap = jsonDecode(response) as Map<String, dynamic>;

  // 3. Extrae la propiedad 'data' y la convierte al modelo
  final Map<String, dynamic> dataMap = jsonMap['data'] as Map<String, dynamic>;

  return MembershipModel.fromJson(dataMap);
}
}
